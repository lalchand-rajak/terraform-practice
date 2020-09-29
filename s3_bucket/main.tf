provider "aws"{
    region = "ap-south-1"
    profile = "lalchand-terraform"
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "mys3-24092020"
  acl    = "private"

  tags = {    
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "First-file" {
  bucket = "${aws_s3_bucket.my_s3_bucket.id}"
  key    = "sample.txt"
  source = "D:/Airtel/sample.txt"  
  etag = filemd5("D:/Airtel/sample.txt")
}