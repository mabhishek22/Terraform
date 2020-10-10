

resource "aws_s3_bucket_object" "object" {

  bucket = "assignment-terraform"

  key    = "Pokemon"

  acl    = "public-read"

  source = "C:/Users/lenovo/Desktop/ab/Pokemon.csv"

 

}