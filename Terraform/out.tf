output master_ec2_public_ip {
  value = "${aws_instance.k8s_master.public_ip}"
}

#output workers_ec2_public_ip {
#  value = "${join("\n",aws_instance.k8s_workers.*.public_ip)}"
#}

output worker1_ec2_public_ip {
  value = "${aws_instance.k8s_workers[0].public_ip}"
}

output worker2_ec2_public_ip {
  value = "${aws_instance.k8s_workers[1].public_ip}"
}