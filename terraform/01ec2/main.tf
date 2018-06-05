variable access_key {}
variable secret_key {}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "ap-southeast-1"
}

resource "aws_instance" "t2-ec2-instance" {
  ami = "ami-c3a996bf"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform ec2"
    Environment = "development"
  }
}
