resource "aws_subnet" "public-subnets" {
  count      = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PUBLIC_SUBNET_CIDR[count.index]

  tags = {
    Name = "public-subnets"
  }
}

resource "aws_subnet" "private-subnets" {
  count      = length(var.PRIVATE_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PRIVATE_SUBNET_CIDR[count.index]

  tags = {
    Name = "private-subnets"
  }
}