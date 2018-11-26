variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}


provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}


resource "aws_s3_bucket" "terraform_state"{
  bucket = "terraform-up-and-runnng-state-david"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

/* terraform remote config doesn't seem to be a thing anymore, attempting workaround with thie */

terraform {
  backend "s3" {
  bucket="terraform-up-and-runnng-state-david"
  key="terraform.tfstate"
  region="us-east-1"
  }
}




