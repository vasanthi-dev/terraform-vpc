data "aws_caller_identity" "current" {}

data "aws_vpc" "default" {
  default = true
}

data "aws_route53_zone" "privatezone" {
  name         = "roboshop.internal"
  private_zone = true
}

