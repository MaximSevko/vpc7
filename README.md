# Terraform VPC7

This Terraform code creates a VPC with 3 IPv6-only private subnets, 3 IPv6-only intra subnets, an egress-only gateway, and an internet gateway. The private subnets are associated with the egress-only gateway, which is then connected to the internet gateway. 

## Usage

1. Clone this repository: git clone https://github.com/MaximSevko/vpc7.git

2. Change directory to the cloned repository: cd vpc7

3. Modify the `variables.tf` file to set the VPC and subnet CIDR blocks as desired. You can also modify the `aws_region` variable if you want to deploy to a different AWS region.

4. Run `terraform init` to initialize the Terraform workspace:

5. Run `terraform plan` to see the changes that will be made.

6. If the plan looks good, run `terraform apply` to create the VPC and its resources.

7. When you're finished, run `terraform destroy` to delete the resources and destroy the VPC.
