terraform {
  backend "s3" {
    bucket         = "ecolaura-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "ecolaura-terraform-locks"
  }
}