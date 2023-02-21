variable "region" {
    type = string
    description = "default region"
    default = "ap-south-1"
}
variable "vpc-name" {
    type = string
    description = "name of the vpc"
    default = "learn-terraform"
}
variable "cidr" {
    type = string
    description = "cidr block for the vpc"
    default = "192.168.0.0/16"
}

variable "subnet-azs" {
    type = list(string)
    description = "availability zones for the subnets"
    default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "private-cidr" {
    type = list(string)
    description = "cidr block for the private subnets"
    default = ["192.168.48.0/20", "192.168.64.0/20", "192.168.80.0/20"]
}

variable "public-cidr" {
    type = list(string)
    description = "cidr block for the public subnets"
    default = ["192.168.0.0/20", "192.168.16.0/20", "192.168.32.0/20"]
}

variable "igw" {
    type = bool
    description = "create internet gateway"
    default = true
}

variable "private_subnet_names" {
    type = list(string)
    description = "name of the private subnets"
    default = ["private-1", "private-2", "private-3"]
}

variable "public_subnet_names" {
    type = list(string)
    description = "name of the public subnets"
    default = ["public-1", "public-2", "public-3"]
}

variable "bitbucket_cidr" {
  type = list(string)
  description = "List of allowed CIDR blocks"
  default = [
    "34.199.54.113/32",
    "34.232.25.90/32",
    "34.232.119.183/32",
    "34.236.25.177/32",
    "35.171.175.212/32",
    "52.54.90.98/32",
    "52.202.195.162/32",
    "52.203.14.55/32",
    "52.204.96.37/32",
    "34.218.156.209/32",
    "34.218.168.212/32",
    "52.41.219.63/32",
    "35.155.178.254/32",
    "35.160.177.10/32",
    "34.216.18.129/32",
    "3.216.235.48/32",
    "34.231.96.243/32",
    "44.199.3.254/32",
    "174.129.205.191/32",
    "44.199.45.64/32",
    "3.221.151.112/32",
    "52.205.184.192/32",
    "52.72.137.240/32",
    "44.199.127.226/32"
  ]
}

variable "allowed_cidr_blocks_v4" {
  type    = list(string)
  default = [
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "104.16.0.0/13",
    "104.24.0.0/14",
    "108.162.192.0/18",
    "131.0.72.0/22",
    "141.101.64.0/18",
    "162.158.0.0/15",
    "172.64.0.0/13",
    "173.245.48.0/20",
    "188.114.96.0/20",
    "190.93.240.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17",
  ]
}

variable "allowed_cidr_blocks_v6" {
  type    = list(string)
  default = [
    "2400:cb00::/32",
    "2606:4700::/32",
    "2803:f800::/32",
    "2405:b500::/32",
    "2405:8100::/32",
    "2a06:98c0::/29",
    "2c0f:f248::/32",
  ]
}

variable "allowed_cidr_blocks" {
  type    = list(string)
  default = [
    "192.168.0.0/16"
  ]
}