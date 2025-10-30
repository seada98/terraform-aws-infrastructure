# AWS Infrastructure with Terraform

## 📖 Overview
This project automates the creation of AWS infrastructure using Terraform:
- EC2 instance  
- S3 bucket  
- Security Group with SSH and HTTP access

## ⚙️ Technologies
- Terraform
- AWS

## 🚀 Steps to Run
1. **Configure AWS credentials**
```bash
aws configure
```
2. **Initialize Terraform**
```bash
terraform init
```
3. **Plan the deployment**
```bash
terraform plan
```
4. **Apply the configuration**
```bash
terraform apply
```
5. **Check the outputs**
```bash
terraform output
```

## 📬 Expected Output

- S3 bucket name
- EC2 public IP

## 🧹 Cleanup
```bash
terraform destroy
```
