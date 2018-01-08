module "efs" {
  source    = "./efs"
}

module "efs_mount" {
  source    = "./efs_mount"

  vpc_id            =
  efs_subnets       =
  efs_subnets_count =
}

module "vpc" {
  source = "./vpc"

  global_subnets            =
  global_availability_zones =
}

module "instance" {
  source ="./instance"

  asg_subnets =
  global_key_name =
  instance_type =
  global_availability_zones =
}
