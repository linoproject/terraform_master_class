### Virtual machine data
variable "vm_name" {
  type = string
}

## VM hostname and ip
variable "vm_hostname" {
  type = string
}
variable "ip" {
  type = string
}

## Virtual hardware and connections
variable "vCPU" {
  type = number
  default = 1
}
variable "vMEM" {
  type = number
  default = 1024
}
variable "datastore" {
  type = string
}

variable "network" {
  type = string
}

## Username and password
variable "user" {
  type = string
}
variable "password" { #use mkpasswd --method=SHA-512 --rounds=4096
  type = string
}

## Path
variable "metadata_path" {
  type = string
  default = "${module.path}/metadata.yml"
}
variable "userdata_path" {
  type = string
  default = "${module.path}/userdata.yml"
}