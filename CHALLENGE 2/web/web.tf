resource "aws_instance" "web" {
  ami = "ami-06672d07f62285d1d"
  instance_type = "t2.micro"
  security_groups = [module.sg.sg_name ]

  user_data = file("./web/server-script.sh")
  tags = {
    Name = "Web Server"
  }
}

module "eip" {
  source ="./elasticIP"
  instance_id = aws_instance.web.id
}

module "sg" {
  source = "./security_groups"

}

output "Public_IP" {
  value = module.eip.PublicIP
}


