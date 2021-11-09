


///// CERT for LB  

resource "tls_private_key" "atym" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "atym" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.atym.private_key_pem

  subject {
    common_name  = "atym.pp.ua"
    organization = "DEVPRO"
  }

  validity_period_hours = 120

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_acm_certificate" "cert" {
  private_key      = tls_private_key.atym.private_key_pem
  certificate_body = tls_self_signed_cert.atym.cert_pem
}



///// roles and policies  

resource "aws_iam_instance_profile" "instance_pofile" {
  name = "webserver"
  role = aws_iam_role.S3role.name
}


resource "aws_iam_role" "S3role" {
  name               = "EC2accessS3"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.s3_access.json

}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.S3role.name
  policy_arn = data.aws_iam_policy.s3_access.arn
}

data "aws_iam_policy_document" "s3_access" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
data "aws_iam_policy" "s3_access" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


