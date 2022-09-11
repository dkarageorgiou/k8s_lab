resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "k8s_master" {
    ami           = var.AMIs[var.aws_region]
    instance_type = "t2.micro"
    key_name      = aws_key_pair.mykey.key_name
    #vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    provisioner "local-exec" {
    command = "echo ${aws_instance.k8s_master.public_ip} > tmp/k8s_master.txt"
  }
}

resource "aws_instance" "k8s_workers" {
    count         = 2
    ami           = var.AMIs[var.aws_region]
    instance_type = "t2.micro"
    key_name      = aws_key_pair.mykey.key_name
    #vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    provisioner "local-exec" {
    command = ">tmp/k8s_workers.txt; echo ${aws_instance.k8s_workers[0].public_ip} >> tmp/k8s_workers.txt"
  }
}