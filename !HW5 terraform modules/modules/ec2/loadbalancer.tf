
resource "aws_lb" "lb" {
  name               = "lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.nginx-sg.id}"]
  subnets            = module.net.public_subnets_ids

  enable_deletion_protection = false


}


resource "aws_lb_listener" "webserver_lb" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.cert.arn
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx-tg.arn
  }
}

resource "aws_lb_listener_rule" "phpmyadmin" {
  listener_arn = aws_lb_listener.webserver_lb.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.phpmyadmin-tg.arn
  }

  condition {
    path_pattern {
      values = ["/phpmyadmin/*"]
    }
  }

  
  }



///   nginx target group

resource "aws_lb_target_group" "nginx-tg" {
  name     = "nginx-tg"
  port     = 443
  protocol = "HTTPS"
  target_type = "instance"
  vpc_id           = module.net.vpc_id
}

resource "aws_lb_target_group_attachment" "nginx1" {
  target_group_arn = aws_lb_target_group.nginx-tg.arn
  target_id        = aws_instance.ubuntu[0].id
  port             = 443     
  
}
resource "aws_lb_target_group_attachment" "nginx2" {
  target_group_arn = aws_lb_target_group.nginx-tg.arn
  target_id        = aws_instance.ubuntu[1].id
  port             = 443
  
}

/// phpmyadmin target group

resource "aws_lb_target_group" "phpmyadmin-tg" {
  name     = "phpmyadmin-tg"
  port     = 443
  protocol = "HTTPS"
  target_type = "instance"
  vpc_id           = module.net.vpc_id
}

resource "aws_lb_target_group_attachment" "phpmyadmin" {
  target_group_arn = aws_lb_target_group.phpmyadmin-tg.arn
  target_id        = aws_instance.ubuntu[2].id
  port             = 443
  
}
