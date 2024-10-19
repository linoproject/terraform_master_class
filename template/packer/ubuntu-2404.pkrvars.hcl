##################################################################################
# VARIABLES
##################################################################################

# HTTP Settings

http_directory = "http"

# Virtual Machine Settings

vm_name                     = "ubuntu2204" #Template name
vm_guest_os_type            = "ubuntu64Guest"
vm_version                  = 17
vm_firmware                 = "bios"
vm_cdrom_type               = "sata"
vm_cpu_sockets              = 2
vm_cpu_cores                = 2
vm_mem_size                 = 4096
vm_disk_size                = 20480
thin_provision              = true
disk_eagerly_scrub          = false
vm_disk_controller_type     = ["pvscsi"]
vm_network_card             = "vmxnet3"
vm_boot_wait                = "5s"
ssh_username                = "ubuntu"
ssh_password                = "ubuntu"

# ISO Objects

iso_file                    = "ubuntu-22.04.4-live-server-amd64.iso"
iso_checksum                = "45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2"
iso_checksum_type           = "sha256"
iso_url                     = "https://releases.ubuntu.com/jammy/ubuntu-22.04.4-live-server-amd64.iso" 
# Scripts

shell_scripts               = ["./scripts/setup_ubuntu2204.sh"]