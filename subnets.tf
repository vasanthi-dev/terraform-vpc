resource "aws_subnet" "public-subnet" {
  count      = length(var.PUBLIC_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PUBLIC_SUBNET_CIDR[count.index]

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private-subnet" {
  count      = length(var.PRIVATE_SUBNET_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PRIVATE_SUBNET_CIDR[count.index]

  tags = {
    Name = "private-subnet--${count.index}"
  }
}