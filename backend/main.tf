provider "aws" {
  region = "eu-west-2"
    access_key = "<your-access-key>"
    secret_key = "<your-secret-key>"
}

resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
}