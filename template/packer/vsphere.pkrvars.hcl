##################################################################################
# VARIABLES
##################################################################################

# Credentials (vcsa user/password)

vcenter_username                = "administrator@vsphere.local"
vcenter_password                = "*********"

# vSphere Objects

vcenter_insecure_connection     = true
vcenter_server                  = "vcsa01.linoproject.lab" # vcenter deployment data
vcenter_datacenter              = "datacenter1"
vcenter_host                    = "esxi1.linoproject.lab"
vcenter_datastore               = "datastore1"
vcenter_network                 = "MGMT"
vcenter_folder                  = "templates"

# ISO Objects
iso_path                        = "" #Datastore iso path of OS