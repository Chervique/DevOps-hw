resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "NEW"
  }
  
}

module "net" {
  source = "./modules/net"
  vpc_id = aws_vpc.main.id
public_cidr_block = "10.0.1.0/24"
private_cidr_block = "10.0.2.0/24"

}


module "nginx" {
  source = "./modules/ec2_web"
  vpc_id = aws_vpc.main.id

count = 2
  subnet_id = module.net.public_id
  webserver_name = "nginx"

//  zones = var.zones[count.index]
  
}

module "phpmyadmin" {
  source = "./modules/ec2_web"
  subnet_id = module.net.private_id
  

  vpc_id = aws_vpc.main.id
  
  webserver_name = "phpmyadmin"

 // zones = ["eu-central-1a","eu-central-1b"]
  
}

module "EC2_policy" {
 source = "./modules/sec"
policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"

}


///// S3      
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