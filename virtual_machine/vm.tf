module "vm" {
  source = "./vm"
  
  #template = var.vm.template
  template = "ubuntu2204"

  vm_name = var.vm.vmname
  vm_hostname = var.vm.hostname
  ip = var.vm.ip

  datastore = var.vm.datastore
  cluster = var.vm.cluster
  datacenter = var.VC_datacenter
  vCPU = var.vm.vCPU
  vMEM = var.vm.vMEM

  network = var.vm.network
  user = var.vm.user
  password = var.vm.password

  metadata_path = "./vm/cloudinit/metadata.yml"
  userdata_path = "./vm/cloudinit/userdata.yml"

}
