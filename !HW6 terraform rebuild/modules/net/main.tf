resource "aws_subnet" "public" {
    vpc_id = var.vpc_id
    cidr_block = var.public_cidr_block
    map_public_ip_on_launch = true
    availability_zone = "eu-central-1a"
    tags = {
        Name = "public subnet"
    }
 //  availability_zone = var.zones
   
}

resource "aws_subnet" "private" {
    vpc_id = var.vpc_id
    cidr_block = var.private_cidr_block
    map_public_ip_on_launch = true
    availability_zone = "eu-central-1b"
    tags = {
        Name = "private subnet"
    }
//    availability_zone = var.zones
    
} 


resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "gateway"
  }
}



data "aws_route_table" "selected" {
  vpc_id = var.vpc_id
}


resource "aws_route" "inet" {
  
  route_table_id            = data.aws_route_table.selected.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.gw.id
}