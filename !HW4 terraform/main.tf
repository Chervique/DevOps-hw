/// Buckets
resource "aws_s3_bucket" "atymhw4" {
  bucket = "atymhw4"
  acl    = "private"
}

resource "aws_s3_bucket_object" "object" {
  for_each = fileset("for_s3/", "*")
  bucket   = aws_s3_bucket.atymhw4.id
  key      = each.value
  source   = "for_s3/${each.value}"

  etag = filemd5("for_s3/${each.value}")

}

/// Instances
resource "aws_instance" "nginx1" {
  ami                    = "ami-0a49b025fffbbdac6"
  instance_type          = "t2.micro"
  user_data              = file("nginx.sh")
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  key_name               = "AWS atym"
  iam_instance_profile   = "webserver"
  subnet_id              = aws_subnet.sn-1.id


  tags = {
    Name = "Nginx1"
  }
}

resource "aws_instance" "nginx2" {
  ami                    = "ami-0a49b025fffbbdac6"
  instance_type          = "t2.micro"
  user_data              = file("nginx.sh")
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  key_name               = "AWS atym"
  iam_instance_profile   = "webserver"
  subnet_id              = aws_subnet.sn-1.id


  tags = {
    Name = "Nginx2"
  }
}

resource "aws_instance" "phpmyadmin" {
  ami                    = "ami-0a49b025fffbbdac6"
  instance_type          = "t2.micro"
  user_data              = file("phpmyadmin.sh")
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  key_name               = "AWS atym"
  iam_instance_profile   = "webserver"
  subnet_id              = aws_subnet.sn-1.id


  tags = {
    Name = "Phpmyadmin"
  }
}


