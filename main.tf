provider "aws" {
  region = var.region
}

# Create an S3 bucket
resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.project_name}-bucket-${random_id.bucket_id.hex}"

  tags = {
    Name        = "${var.project_name}-bucket"
    Environment = var.environment
  }
}

# Enforce bucket owner-only ownership; disables ACLs usage
resource "aws_s3_bucket_ownership_controls" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Random suffix for uniqueness
resource "random_id" "bucket_id" {
  byte_length = 4
}

# Security group
resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}

# EC2 instance
resource "aws_instance" "app_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "${var.project_name}-server"
  }
}

output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}
