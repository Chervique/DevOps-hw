resource "aws_instance" "ubuntu" {
  count = var.instance_count
  #vpc_id = aws_vpc.main.id
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  
 # user_data              = var.ec2_user_data
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  key_name               = var.ec2_key_name
  iam_instance_profile   = var.ec2_iam_instance_profile
  subnet_id              = aws_subnet.sn-1.id 
  

  user_data     = file("nginx.sh")

 tags = {
    Name = var.ec2_instance_name[count.index]
  }
  
}



