resource "aws_elb" "elb" {
  availability_zones = "${var.global_availability_zones}"
  security_groups = "${aws_security_group.sg.id}"

  listener {
    instance_port     = 1414
    instance_protocol = "TCP"
    lb_port           = 1414
    lb_protocol       = "TCP"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "TCP:1414"
    interval            = 60
  }

  tags {
    Name = "foobar-terraform-elb"
  }
}
