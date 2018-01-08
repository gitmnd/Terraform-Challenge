resource "aws_security_group" "efs_sg" {
  name        = "MountTargetSecurityGroup"
  description = "Security group for mount target"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "efs_ingress" {
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.efs_sg.id}"
}
