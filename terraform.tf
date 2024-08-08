### Requirements
# - HCP and TFC accounts (org and workspace)
# - Vault APP (with default esxi user and pwd)
# - vCenter and at least a vCenter host
# - Terraform cloud agent
# - Env variables defined in org
terraform {
  cloud {
    organization = "lino1" ##Change org according to TFC 

    workspaces {
      name = "vSphereAtCode" ##Change workspace accoring to TFC
    }
  }

  required_providers {
    hcp = {
        source = "hashicorp/hcp"
        version = "0.91.0"
    }
  }

}

### Secret in organization and/or in the workspace
provider "hcp" {
    client_id = var.HCP_CLIENT_ID
    client_secret = var.HCP_CLIENT_SECRET
  
}
provider "vsphere" {
  user = var.VC_USER
  password = var.VC_PASS
  vsphere_server = var.VC_HOST

  allow_unverified_ssl = true #this is a lab :-)
  api_timeout = 10
}

### Valut defintion -> APP -> esxi default user and esxi default pwd (change variables)
data "hcp_vault_secrets_secret" "esxi_default_username" {
    app_name = var.HCP_VAULT_SECRET_APP
    secret_name = var.HCP_VAULT_SECRET_SECRET_ESXI_USERNAME
}
data "hcp_vault_secrets_secret" "esxi_default_pwd" {
    app_name = var.HCP_VAULT_SECRET_APP
    secret_name = var.HCP_VAULT_SECRET_SECRET_ESXI_PWD
}
