data "vsphere_datacenter" "datacenter" {
    name = var.datacenter
}

data "vsphere_compute_cluster" "cluster"{
    datacenter_id = data.vsphere_datacenter.datacenter.id
    name = var.cluster
}
data "vsphere_datastore" "datastore1" {
    name = var.datastore
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
    name = var.template
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "vm_net" {
    name = var.network
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

locals {
  metadata_path = var.metadata_path == "" ? "${path.module}/cloudinit/metadata.yml" : var.metadata_path
}
locals {
  userdata_path = var.userdata_path == "" ? "${path.module}/cloudinit/userdata.yml" : var.userdata_path
}

data template_file "metadata" {

  # Main cloud-config configuration file.
  template = file(local.metadata_path)
  vars = {
    ip = "${var.ip}"
  }
}

data template_file "userdata" {

  # Main cloud-config configuration file.
  template = file(local.userdata_path)
  vars = {
    user = "${var.user}"
    password = "${var.password}"
  }
}

resource "vsphere_virtual_machine" "vm1" {
  name = var.vm_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore1.id

  num_cpus = var.vCPU
  memory = var.vMEM
  guest_id = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  wait_for_guest_net_timeout = 0

  cdrom {
    client_device = true
  }

  network_interface {
    network_id = data.vsphere_network.vm_net.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid =  data.vsphere_virtual_machine.template.id
  }

  firmware = "efi"
  #efi_secure_boot_enabled = true
  
  # vapp {
  #   properties ={
  #     hostname = var.vm.hostname
  #     user-data = base64encode(data.template_file.kickstartconfig.rendered)
  #   }
  # }
   extra_config = {
    "guestinfo.metadata"          = base64encode(data.template_file.metadata.rendered)
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = base64encode(data.template_file.userdata.rendered)
    "guestinfo.userdata.encoding" = "base64"
  }

  # # Check if VM is ready
  # provisioner "remote-exec" {

    
  # }

}