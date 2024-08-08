### VMware Datacenter data 
variable "VC_datacenter" {
  type = string
  default = "datacenter1"
}
variable "VC_cluser" {
  type = string
  default = "cluster1"
}
variable "VC_esxi_hosts" {
    default = [
        "esxi1.linoproject.lab"
    ]
  
}

## Networking
variable "vds_name" {
  type = string
  default = "vdsProduction"
}
variable "dvpgManagement" {
  type = string
  default = "dvpgManagement"
}
variable "dvpgManagementVLAN" {
  type = string
  default = "200"
}
