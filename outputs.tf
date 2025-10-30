output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.app_bucket.id
}

output "instance_public_ip" {
  description = "EC2 instance public IP"
  value       = aws_instance.app_server.public_ip
}
