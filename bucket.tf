resource "aws_s3_bucket" "bucket" {
   bucket = "assignment-terraform"
   acl = "public-read"
   versioning {
      enabled = true
   }
   tags = {
     Name = "assignment-bucket"
   }
}