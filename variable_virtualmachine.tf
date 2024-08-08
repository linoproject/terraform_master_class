
variable "vm" {
    type = object({
        vCPU = number
        vMEM = number
        vmname = string
        datastore = string
        network = string
        user = string
        password = string
        template = string
     
        hostname = string
        ip = string
    })

    default = {
      template = "ubuntu2204"
     
      vCPU = 2
      vMEM = 4096
      vmname = "vmtest"
      datastore = "Datastore1"
      network = "dvpgManagement"
      
      user = "admin"
      password = "$6$rounds=4096$1eTMuv3JplV1GTzD$6J0vKel7Zcng/nQISgUAxnHR3GacDlc4Lda8uGH2fR82Y0LXCqciiYg32vV9PuNSQcxB9e9sBFgpbhBdu3ZiG/"
      hostname = "vmtest1.linoproject.lab"
      ip = "192.168.200.51"
    }
}
