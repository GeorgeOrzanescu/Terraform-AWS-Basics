variable "ec2name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-06672d07f62285d1d"
  instance_type = "t2.micro"

  tags = {
    Name = var.ec2name
  }
}

output "ec2_instance_id" {
  value = aws_instance.ec2.id
}