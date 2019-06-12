terraform { backend "s3" {} }
provider "openstack" { version = "~> 1.16" }
provider "template" { version = "~> 2.1" }

# Package-like metadata
locals {
  deployment_version = "0.1.0"
  dependency = { }
}

module "jupyter_data" {
  source              = "../../infrastructure/volumes/standard"
  datacenter          = "${var.datacenter}"
  programme           = "${var.programme}"
  env                 = "${var.env}"
  deployment_name     = "${var.deployment_name}"
  deployment_owner    = "${var.deployment_owner}"
  volume_name         = "data"
  size                = "${var.size}"
  count               = 1
}
