

/// Buckets
module "s3_bucket" {
  source = "./modules/s3"

  bucket_name = "atymhw4"
  bucket_type = "public-read"
}


resource "aws_s3_bucket_object" "object" {
  for_each = fileset("for_s3/", "*")
  bucket   = module.s3_bucket.bucket_name
  key      = each.value
  source   = "for_s3/${each.value}"

  etag = filemd5("for_s3/${each.value}")

}

/// Instances


module "ec2" {
  source = "./modules/ec2"
  

}

resource "aws_vpc" "main" {
  
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "new vpc"
  }

}
/*
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
*/

