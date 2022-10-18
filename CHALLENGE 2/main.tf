provider "aws" {
  region = "eu-west-2"
    access_key = "<your-access-key>"
    secret_key = "<your-secret-key>"
}


module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}
 

output "PrivateIP" {
  value = module.db.PrivateIP
}

output "PublicIP" {
  value = module.web.Public_IP
}