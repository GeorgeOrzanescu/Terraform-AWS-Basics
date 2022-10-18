resource "aws_instance" "db" {
  ami = "ami-06672d07f62285d1d"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}
