resource "aws_s3_bucket""my-bucket" {
  bucket = "meri-lolli-bucket"
  tags = {
    Name = "meri-lolli-bucket"
    
  }
}