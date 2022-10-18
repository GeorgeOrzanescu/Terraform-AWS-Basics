provider "aws" {
  region = "eu-west-2"
    access_key = "<your-access-key>"
    secret_key = "<your-secret-key>"
}

resource "aws_instance" "ec2" {
  ami = "ami-06672d07f62285d1d"
  instance_type = "t2.micro"
}