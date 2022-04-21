resource "aws_s3_bucket" "demo" {
    bucket = "demo---sally"
    tags   = {
        Name  = "demo bucket"
    }
}