variable env {}
variable subnet_id {}
variable key_name {}
variable instance_type {
  default = "t2.micro"
}
variable "security_groups" {type="list"}

resource "aws_instance" "t2-instance" {
  ami = "ami-c3a996bf"
  subnet_id = "${var.subnet_id}"
  key_name = "${var.key_name}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = "${var.security_groups}"
   tags = {
    Name = "terraform ec2"
    Environment = "${var.env}"
  }
}
