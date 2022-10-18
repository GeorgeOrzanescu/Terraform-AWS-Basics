provider "aws" {
  region = "eu-west-2"
    access_key = "<your-access-key>"
    secret_key = "<your-secret-key>"
}

variable "ingressrules" {
    type = list(number)
    default = [80,443]
}

variable "egressrules" {
    type = list(number)
    default = [80,443,25,3306,53,8080]
}

resource "aws_instance" "ec2" {
  ami = "ami-06672d07f62285d1d"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"
  #   u can have a range using the from and to
  dynamic "ingress" { 
    iterator = port
    for_each = var.ingressrules
    content{
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
    
  }

  dynamic "egress" { 
    iterator = port
    for_each = var.egressrules
    content{
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
}
}