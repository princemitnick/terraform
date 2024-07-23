#---root/main.tf---#

provider "aws" {
  region = local.location
}

locals {
  cwd = reverse(split("/", path.cwd ))
  instance_type = local.cwd[1]
  location = local.cwd[2]
  environment = local.cwd[3]
}