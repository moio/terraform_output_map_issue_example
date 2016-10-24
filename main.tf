provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

module "base" {
  source = "./base"
  param1 = "1"
}

module "extension" {
  source = "./extension"
  configuration = "${module.base.configuration}"
}

output "configuration" {
  value = "${module.extension.configuration}"
}
