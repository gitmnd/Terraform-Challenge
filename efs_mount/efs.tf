resource "aws_efs_mount_target" "efs_mount_target" {
  count           = "${var.efs_subnets_count}"
  file_system_id  = "${var.efs_id}"
  subnet_id       = "${element(split(",", var.efs_subnets), count.index)}"
  security_groups = ["${aws_security_group.efs_sg.id}"]
}
