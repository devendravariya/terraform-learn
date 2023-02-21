resource "aws_security_group" "bitbucket_ips" {
  name = "bitbucket_ips"
  description = "Security group for Bitbucket IPs"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.bitbucket_cidrs
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "http_https" {
  name_prefix = "http-https-"
  description = "Allow inbound traffic on ports 80 and 443"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks_v4
    ipv6_cidr_blocks = var.allowed_cidr_blocks_v6
  }
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks_v4
    ipv6_cidr_blocks = var.allowed_cidr_blocks_v6
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
