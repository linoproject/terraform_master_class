### HCP varible definition
variable "HCP_CLIENT_ID" {
  type = string
}
variable "HCP_CLIENT_SECRET" {
  type = string
}

### Vault secret
variable "HCP_VAULT_SECRET_APP" {
  type = string
  default = "vspherelab"
}
variable "HCP_VAULT_SECRET_SECRET_ESXI_USERNAME" {
  type = string
  default = "esxi_default_username"
}
variable "HCP_VAULT_SECRET_SECRET_ESXI_PWD" {
  type = string
  default = "esxi_default_password"
}

### vCenter connection varibles
variable "VC_HOST" {
  type = string
}
variable "VC_USER" {
  type = string
  sensitive = true
  default = "administrator@vsphere.local"
}
variable "VC_PASS" {
  type=string
  sensitive = true
}