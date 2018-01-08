resource "aws_security_group" "sg" {
  name        = "${var.ms_application}-sg-${var.global_environment}"
  description = "Authorize HTTP access to ms host from the ms ALB."
  vpc_id      = "${var.global_vpc_id}"
}

resource "aws_security_group_rule" "allow_ingress_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ms_sg.id}"
  cidr_blocks              = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "allow_ingress_porta" {
  type                     = "ingress"
  from_port                = 1414
  to_port                  = 1414
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ms_sg.id}"
  cidr_blocks              = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "allow_ingress_portb" {
  type                     = "ingress"
  from_port                = 7080
  to_port                  = 7080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ms_sg.id}"
  cidr_blocks              = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "allow_ingress_portc" {
  type                     = "ingress"
  from_port                = 7083
  to_port                  = 7083
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ms_sg.id}"
  cidr_blocks              = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "allow_ingress_portd" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ms_sg.id}"
  cidr_blocks              = ["0.0.0.0/0"]
}
