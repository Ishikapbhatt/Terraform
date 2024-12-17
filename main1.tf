provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-demo-bucket-${terraform.workspace}"
  acl    = "private"

  tags = {
    Environment = terraform.workspace
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}
