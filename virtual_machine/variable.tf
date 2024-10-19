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
variable "VC_datacenter" {
  type = string
  default = "datacenter1"
}