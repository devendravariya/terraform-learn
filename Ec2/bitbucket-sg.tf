resource "aws_security_group" "bitbucket_ips" {
  name = "bitbucket_ips"
  description = "Security group for Bitbucket IPs"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.bitbucket_cidr
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "cloudflare_sg" {
  name_prefix = "cloudflare_sg"
  description = "Allow inbound traffic on ports 80 and 443"
  vpc_id = module.vpc.vpc_id
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks =  var.allowed_cidr_blocks_v4
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


resource "aws_security_group" "ssh" {
  name_prefix = "web-ssh-sg"
  description = "Allow inbound traffic on port 22"
  vpc_id = module.vpc.vpc_id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks

  }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}