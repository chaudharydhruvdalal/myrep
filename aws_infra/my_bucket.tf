resource "aws_s3_bucket" "my-bucket" {
  bucket = "${var.my-env}-meri-lolli-bucket"
  tags = {
    Name = "${var.my-env}meri-lolli-bucket"
    environment = var.my-env
  }
}