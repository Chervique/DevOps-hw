resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  
  tags = {
    Name = "NEW"
  }
  
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "gateway"
  }
}



data "aws_route_table" "selected" {
  vpc_id = aws_vpc.main.id
}


resource "aws_route" "inet" {
  route_table_id            = data.aws_route_table.selected.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.gw.id
}


/*
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sn-1.id
  route_table_id = aws_route_table.rt.id
}
*/


resource "aws_subnet" "public" {
  count = var.number_of_AZ
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.zones[count.index]
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public subnet"
  } 
}
/*
resource "aws_subnet" "private" {
 count = var.number_of_AZ 
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.zones[count.index]
  map_public_ip_on_launch = "false"

  tags = {
    Name = "private subnet"
  }
}

*/