provider "aws" {
  region = "us-east-1"
}
variable "os" {
  type = string
  default = "ami-02e136e904f3da870"
}

variable "hw" {
default = "t2.nano"
}

variable "key" {
default = "ed-20Sep"
}

resource "aws_instance" "myawsserver" {
  ami = var.os
  instance_type = var.hw
  key_name = var.key
  tags = {
    Name = "mahesh-aws-ec2-instanceV3"
    Env = "PROD"
  }
}


output "myawsserver-ip" {
  value = aws_instance.myawsserver.public_ip
}

output "myserver-PrivateIP" {
  value = aws_instance.myawsserver.private_ip
}
