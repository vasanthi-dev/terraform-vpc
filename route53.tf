resource "aws_route53_zone" "example" {
  vpc_id  = aws_vpc.main.id
  zone_id = data.aws_route53_zone.privatezone.zone_id
}

//var.PRIVATE_HOSTED_ZONEID
