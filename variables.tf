variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "devops-demo"
}

variable "environment" {
  description = "Environment type"
  type        = string
  default     = "dev"
}

variable "ami" {
  description = "Amazon Machine Image ID"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 (change if needed)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
  default     = "my-keypair"
}

variable "vpc_id" {
  description = "VPC ID to attach resources"
  type        = string
  default     = "vpc-xxxxxxxx" # change to your VPC
}
