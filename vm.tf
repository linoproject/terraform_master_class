module "vm" {
  source = "./vm"
  
  vm_name = var.vm.vm_name
  vm_hostname = var.vm.vm_hostname
  ip = var.vm.ip

  datastore = var.vm.datastore
  vCPU = var.vm.vCPU
  vMEM = var.vm.vMEM

  network = var.vm.network
  user = var.vm.user
  password = var.vm.password

  metadata_path = "./vm/cloudinit/metdata.yml"
  userdata_path = "./vm/cloudinit/userdata.yml"

}
