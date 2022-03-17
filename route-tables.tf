resource "aws_route_table" "public-table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-rt"
    ENV = var.ENV
  }
}

resource "aws_route_table" "private-table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-rt"
    ENV = var.ENV
  }
}

resource "aws_route_table_association" "public" {
  count      = length(aws_subnet.public-subnet)
  subnet_id      = aws_subnet.public-subnet.*.id[count.index]
  route_table_id = aws_route_table.public-table.id
}

resource "aws_route_table_association" "private" {
  count      = length(aws_subnet.private-subnet)
  subnet_id      = aws_subnet.private-subnet.*.id[count.index]
  route_table_id = aws_route_table.private-table.id
}

resource "aws_route" "public-igw-route" {
  route_table_id            = aws_route_table.public-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.gw.id
}