# How To Python + AWS + Terraform

## About
This project is the support of a speed run to learn Python, deploy a basic API Python on AWS using Terraform

## Steps

- [x] Learn Python Speed Run
- [x] Create a basic Python JSON API using Flask
- [x] Learn Terraform Speed Run
- [x] Create Terraform configuration to deploy infrastructure configuration to AWS

## Before using Terraform

1. Make sure to create a key pair named `HowToPythonAwsTerraform` in your AWS IAM console and specify this key pair name in the Terraform variables file
2. Install the associated PEM file in your `.ssh` directory
3. Modify appropriate `variables*.tfvars.example` file and rename it to `variables.tfvars`

## Using Terraform

1. Initialize Terraform using the command : `terraform init`
2. Create a `variables.tfvars` file containing variables such as `pem_key_path` and `local_app_path`
3. To apply Terraform configuration, run the command : `terraform apply -var-file variables.tfvars`
4. To destroy the infrastructure created, run the command : `terraform destroy -var-file variables.tfvars`

Current Terraform configuration will create a basic EC2 instance based on Amazon Image ami-0afd55c0c8a52973a (Free-Tier eligible Ubuntu image) in the eu-west-3 region (Paris).
