provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "webmagicinformaticaterraformexamples"
  acl    = "private"
}

resource "aws_instance" "ec2example" {
  ami = "ami-00eb20669e0990cb4"
  instance_type = "t2.micro"
  depends_on = [aws_s3_bucket.example]
  tags = {
      Name = "EC2withterraform"
  }
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.ec2example.id
}