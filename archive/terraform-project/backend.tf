terraform {
  backend "s3" {
    bucket         = "pranay-terraform-state-demo"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
  }
}