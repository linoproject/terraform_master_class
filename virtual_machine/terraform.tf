### Requirements
# - HCP and TFC accounts (org and workspace)
# - Vault APP (with default esxi user and pwd)
# - vCenter and at least a vCenter host
# - Terraform cloud agent
# - Env variables defined in org
terraform {
  cloud {
    organization = "linoproject" ##Change org according to TFC 

    workspaces {
      name = "vSphereAtCodeVM" ##Change workspace accoring to TFC
    }
  }

  required_providers {
    hcp = {
        source = "hashicorp/hcp"
        version = "0.91.0"
    }
  }

}

provider "vsphere" {
  user = var.VC_USER
  password = var.VC_PASS
  vsphere_server = var.VC_HOST

  allow_unverified_ssl = true #this is a lab :-)
  api_timeout = 10
}
