terraform {
  backend "s3" {
    bucket = "search-exp-terraform-state"
    region = "ap-southeast1"
    key = "sts-terraform"
  }
}
