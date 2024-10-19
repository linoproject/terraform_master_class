# Terraform vSphere Master Class - Datacenter

## Release

| *Date*     | *Release*| *Note*        |
|------------|:--------:|---------------|
| 2021-09-08 | 1.0      | First release |

## Requirements
1. DNS Server and a lab zone
2. A vCenter Server
3. ESXi host (at least one)
4. HashiCorp Cloud Platform account [https://portal.cloud.hashicorp.com/](https://portal.cloud.hashicorp.com/)
5. Terraform Cloud account [https://app.terraform.io](https://app.terraform.io)

## Note
19/10/2024: HashCorp Platform - Valt secret added the ability to sync passwords with Terraform Workspace using Terraform access token. In this way, Vault secrets are handled as Terraform variables.

## Preparation
1. DNS: In the lab zone set 2 records A
* vCenter Server host
* ESXi host 
2. HashiCorp Platform -> IAM: Service principals: user able to read secrets... under "Keys" generate client_id and secret_id
3. HashiCorp Platform -> Vault Secret: Create the new app with the following secrets:
* esxi_default_username
* esxi_default_password
4. Terraform Cloud: create an organization and a workspace 
5. Terraform Cloud -> Workspace (name): create the following variables:
* HCP_CLIENT_ID (as terraform variable - sensitive)
* HCP_CLIENT_SECRET (as terraform variable - sensitive)
* VC_HOST (as terraform variable - sensitive)
* VC_USER (as terraform variable - sensitive)
* VC_PASS (as terraform variable - sensitive)
* VC_esxi_hosts (as terraform variable - HCL) with a list like `["esxi1.yourlab.local","esxi2.yourlab.local"]`
6. Install a VM or use your PC for Terraform Agent (requires Docker) and check if it is running
7. Generate Terraform Cloud -> API Token -> Generate a token able to plan and apply (user API token)

## Procedure
1. Pull repo and move to datacenter folder
2. Using terraform CLI issue `terraform login` and intert Terraform token
3. In terraform.tf change the organization name with yours `organization = "your-org-name"`
4. In terraform.tf change the workspace name with yours `name = "your-workspace-name"`
5. change the net_main_device in `variable_vsphere.tf` according to your host (vmincN or vusbN) NOTE: the device must not belong to any vSwitch
6. terraform init
7. terraform plan + apply
