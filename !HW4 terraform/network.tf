resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "new vpc"
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
  //  vpc_id                    = aws_vpc.main.id
  route_table_id         = data.aws_route_table.selected.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}


/*
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sn-1.id
  route_table_id = aws_route_table.rt.id
}
*/


resource "aws_subnet" "sn-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "subnet 1.*"
  }
}
resource "aws_subnet" "sn-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "subnet 2.*"
  }
}
