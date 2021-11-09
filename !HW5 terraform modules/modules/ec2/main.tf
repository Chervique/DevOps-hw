resource "aws_instance" "ubuntu" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  user_data              = var.ec2_user_data
 # vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  key_name               = var.ec2_key_name
  iam_instance_profile   = var.ec2_iam_instance_profile
  subnet_id              = var.ec2_subnet_id
  count                   = var.instance_count

  tags = {
    Name  = element(var.instance_name, count.index)
  }


  
}



