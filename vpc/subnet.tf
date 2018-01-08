resource "aws_subnet" "subnets" {
  count                   = "${length(split(",", var.global_subnets))}"
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element(split(",", var.global_subnets), count.index)}"
  availability_zone       = "${element(split(",", var.global_availability_zones), count.index)}"

  tags {
    Name = "MQVPC"
  }
}
