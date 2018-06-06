terraform {
  backend "s3" {
    bucket = "search-exp-terraform-state"
    region = "ap-southeast-1"
    key = "sts-terraform/terraform.tfstate"
  }
}
