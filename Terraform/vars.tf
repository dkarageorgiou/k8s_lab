variable "aws_region" {
    default = "eu-west-1"
}

variable "AMIs" {
    default = {
        eu-west-1 = "ami-0844df7d3ff9efff5"
    }
}

variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "../tmp/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "../tmp/mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}