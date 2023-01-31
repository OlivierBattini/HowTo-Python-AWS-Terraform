variable "aws_region" {
  description = "AWS region to use for EC2 instance creation"
  type        = string
  default     = "eu-west-3"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "PythonAwsTerraform"
}

variable "instance_ami" {
  description = "EC2 instance Amazon Image identifier"
  type        = string
  default     = "ami-0afd55c0c8a52973a"
}

variable "instance_username" {
  description = "EC2 instance user name"
  type        = string
  default     = "ubuntu"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "http_port" {
  description = "EC2 instance HTTP port"
  type        = string
  default     = "5000"
}

variable "iam_key_name" {
  description = "IAM Key name"
  type        = string
  default     = "HowToPythonAwsTerraform"
}

variable "pem_key_path" {
  description = "PEM file path for use with SSH"
  type        = string
}

variable "until_ssh_delay" {
  description = "Delay between 2 SSH connection attempts after instance creation"
  type        = string
  default     = "5"
}

variable "local_app_path" {
  description = "Local path to code to deploy"
  type        = string
}