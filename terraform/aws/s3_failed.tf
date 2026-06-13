resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "checkov-demo-insecure-bucket"
}

resource "aws_s3_bucket_public_access_block" "insecure" {
  bucket = aws_s3_bucket.insecure_bucket.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "disabled" {
  bucket = aws_s3_bucket.insecure_bucket.id

  versioning_configuration {
    status = "Disabled"
  }
}
