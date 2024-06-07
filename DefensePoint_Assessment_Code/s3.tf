resource "aws_s3_bucket" "spa_bucket" {
  bucket = "meu-spa-bucket"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.spa_bucket.bucket
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.spa_bucket.bucket_regional_domain_name
}
