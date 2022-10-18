provider "aws" {
  region = "eu-west-2"
    access_key = "<your-access-key>"
    secret_key = "<your-secret-key>"
} 

module "ec2module" {
  source = "./ec2"
  ec2name = "name from module"
}

output "module_output" {
  value = module.ec2module.ec2_instance_id
}