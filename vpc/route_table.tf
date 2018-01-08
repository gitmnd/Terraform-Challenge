resource "aws_route_table" "route_table" {
  vpc_id           = "${aws_vpc.main.id}"

  tags {
    Name = "MQVPC"
  }
}

resource "aws_route_table" "table" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = "${aws_internet_gateway.main.id}"
  }
}
