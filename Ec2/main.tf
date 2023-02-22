module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc-name
  cidr = var.cidr

  azs             = var.subnet-azs
  private_subnets = var.private-cidr
  public_subnets  = var.public-cidr

  create_igw = var.igw
  private_subnet_names = var.private_subnet_names
  public_subnet_names = var.public_subnet_names
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_support = true
  enable_dns_hostnames = true


  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

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
 tags = {
    Name = "bitbucket_ips"
    Environment = "dev"
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
    tags = {
        Name = "cloudflare_sg"
        Environment = "dev"
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
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks_v4
  }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
        Name = "web-ssh-sg"
        Environment = "dev"
    }
}


resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = var.key_name       # Create a "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.kp.key_name}.pem"
  content = tls_private_key.pk.private_key_pem
}


resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.kp.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id, aws_security_group.bitbucket_ips.id, aws_security_group.cloudflare_sg.id]
  subnet_id = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  user_data = <<EOF
#!/bin/bash
apt-get update
apt-get install -y apache2
EOF
  tags = {
    Name = "web"
    Environment = "dev"
  }
}