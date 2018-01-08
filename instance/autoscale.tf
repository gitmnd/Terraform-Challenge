#--------------------------------------------------------------
# Launch Configuration
#--------------------------------------------------------------
resource "aws_launch_configuration" "lc" {
  image_id             = "ami-a7e302de"
  key_name             = "${var.global_key_name}"
  instance_type        = "${var.instance_type}"
  user_data            = "${template_cloudinit_config.ms_config.rendered}"
  security_groups      = ["${aws_security_group.ms_sg.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

#--------------------------------------------------------------
# Autoscaling Group
#--------------------------------------------------------------
resource "aws_autoscaling_group" "asg" {
  name                      = "${aws_launch_configuration.lc.name}-asg"
  vpc_zone_identifier       = ["${split(",", var.asg_subnets)}"]
  launch_configuration      = "${aws_launch_configuration.ms_lc.name}"

  max_size                  = 1
  min_size                  = 1
  load_balancer             = "${aws_elb.elb.id}"
  health_check_grace_period = 90
  health_check_type         = "ELB"
  desired_capacity          = 1

  tag {
    key                 = "Name"
    value               = "mq-efs"
    propagate_at_launch = true
  }
}
