resource "aws_s3_bucket" "main_s3" {
    bucket = "main-s3-bucket"
  
    tags = {
      Name        = var.bucket_name
      Environment = var.environment
    }
  }

resource "aws_s3_bucket_public_access_block" "s3_block" {
  bucket = aws_s3_bucket.main_s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning_s3" {
  bucket = aws_s3_bucket.main_s3.id
  versioning_configuration {
    status = "Disabled"
  }
}
