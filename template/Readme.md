# Template preparation
Following an example using Packer to prepare Ubuntu 22.04 template \

## Reqirements
1. VMware vSphere vDatacenter
2. DHCP server 
3. Internet connection
4. Deployer machine able to reach vCenter

## Execute
1. Prepare a vSphere Environment (use Terraform datacenter)
2. Install packer
3. move to packer directory and update vsphere.pkrvars.hcl with the correct vSphere vCenter connection data (host, user, password)
4. Execute the following command: \
\
`packer build -force -on-error=ask -var-file ubuntu-2404.pkrvars.hcl -var-file vsphere.pkrvars.hcl ubuntu-2404.pkr.hcl` 
