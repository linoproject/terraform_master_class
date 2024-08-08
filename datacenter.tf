### Datacenter creation
resource "vsphere_datacenter" "lab_datacenter" {
  name = var.VC_datacenter
}
data "vsphere_datacenter" "datacenter" {
    depends_on = [ vsphere_datacenter.lab_datacenter ] 
    name = var.VC_datacenter
}

### Cluster
resource "vsphere_compute_cluster" "lab_cluster" {
  name = var.VC_cluser
  datacenter_id = data.vsphere_datacenter.datacenter.id

  drs_enabled = false

  ha_enabled = false 

  lifecycle {
    ignore_changes = [ datacenter_id, host_system_ids ]
  }
}

data "vsphere_compute_cluster" "lab_cluster" {
    depends_on = [ vsphere_compute_cluster.lab_cluster ]
    name = var.VC_cluser
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host_thumbprint" "thumbprint" {
    count = length(var.VC_esxi_hosts)

    address = var.VC_esxi_hosts[count.index]
    insecure = true
}

resource "vsphere_host" "esx_hosts" {
  count = length(var.VC_esxi_hosts)

  hostname = var.VC_esxi_hosts[count.index]
  username = data.hcp_vault_secrets_secret.esxi_default_username.secret_value
  password = data.hcp_vault_secrets_secret.esxi_default_pwd.secret_value

  thumbprint = data.vsphere_host_thumbprint.thumbprint[count.index].id 
  cluster = data.vsphere_compute_cluster.lab_cluster.id 
  lifecycle {
    ignore_changes = [ cluster, thumbprint ]
  }
}

data "vsphere_host" "esxi_hosts" {
    count = length(var.VC_esxi_hosts)

    depends_on = [ vsphere_host.esx_hosts ]
    datacenter_id = data.vsphere_datacenter.datacenter.id 
    name = var.VC_esxi_hosts[count.index]
}

resource "vsphere_distributed_virtual_switch" "vds" {
  name = var.vds_name
  datacenter_id = data.vsphere_datacenter.datacenter.id 

  uplinks = ["uplink1"]
  active_uplinks = ["uplink1"]
  standby_uplinks = []
  dynamic "host" {
    for_each = var.VC_esxi_hosts
    iterator = singlehost
    content {
      host_system_id = data.vsphere_host.esxi_hosts[singlehost.key].id
      devices = ["vmnic1"]
    }
  }
  

  lifecycle {
    ignore_changes = [ datacenter_id ]
  }
}

resource "vsphere_distributed_port_group" "management_pg" {
  name = var.dvpgManagement
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.vds.id 

  vlan_id = var.dvpgManagementVLAN
}