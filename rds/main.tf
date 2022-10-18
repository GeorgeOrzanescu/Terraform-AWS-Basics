provider "aws" {
  region = "eu-west-2"
    access_key = "<your-access-key>"
    secret_key = "<your-secret-key>"
}

resource "aws_db_instance" "myrds" {
  name = "mydb"
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  username = "bob"
  password = "password1234"
  port = 3306
  allocated_storage = 20

  skip_final_snapshot = true
}