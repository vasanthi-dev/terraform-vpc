resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw-${var.ENV}"
    ENV  = var.ENV
  }
}
resource "aws_eip" "nat-gw" {
  vpc      = true
  tags = {
    Name = "nat-gw-ip-${var.ENV}"
    ENV  = var.ENV
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat-gw.id
  subnet_id     = aws_subnet.public-subnet.*.id[0]

  tags = {
    Name = "ngw-${var.ENV}"
    ENV  = var.ENV
  }
}

