variable env {}
variable vpc_id {}
variable subnet_id {}
variable key_name {}
variable ami_id {}
variable instance_type {
  default = "t2.micro"
}
variable "security_groups" {type="list"}

data "aws_vpc" "vpc"{
  id = "${var.vpc_id}"
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.vpc.id}"
  tags {
    Network = "Private"
  }
}

resource "aws_launch_configuration" "terraform-lc"{
  image_id = "${var.ami_id}"
  key_name = "${var.key_name}"
  security_groups = "${var.security_groups}"
  instance_type = "${var.instance_type}"
  name = "terraform launch configuration"
}

resource "aws_autoscaling_group" "terraform-asg" {
  name = "terraform autoscaling group"
  launch_configuration = "${aws_launch_configuration.terraform-lc.name}"
  vpc_zone_identifier = ["${data.aws_subnet_ids.private.ids}"]
  desired_capacity = 2
  min_size = 1
  max_size = 2
  tag {
    key = "Name"
    value = "terraform asg instance"
    propagate_at_launch = true
  }

  tag {
    key = "Environment"
    value = "${var.env}"
    propagate_at_launch = true
  }
}
