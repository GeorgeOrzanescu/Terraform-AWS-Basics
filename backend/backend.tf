terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "my-backup-state-tf-file"
    region = "eu-west-2"
    access_key = "<your-access-key>"
    secret_key = "<your-secret-key>"
  }
}