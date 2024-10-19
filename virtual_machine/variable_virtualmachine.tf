
variable "vm" {
    type = object({
        datacenter = string
        cluster = string
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
      template = "tpl-ubuntu-22.04"
     
      vCPU = 2
      vMEM = 4096
      vmname = "vmtest"
      datacenter = "datacenter1"
      cluster = "cluster1"
      datastore = "datastore1"
      network = "MGMT"
      
      user = "admin"
      password = "$6$rounds=4096$1eTMuv3JplV1GTzD$6J0vKel7Zcng/nQISgUAxnHR3GacDlc4Lda8uGH2fR82Y0LXCqciiYg32vV9PuNSQcxB9e9sBFgpbhBdu3ZiG/"
      hostname = "vmtest1.linoproject.lab"
      ip = "192.168.90.70"
    }
}
