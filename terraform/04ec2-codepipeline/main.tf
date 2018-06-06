
provider "aws" {}

resource "aws_instance" "t2-ec2-instance" {
  ami = "ami-c3a996bf"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform ec2"
    Environment = "development"
  }
}
