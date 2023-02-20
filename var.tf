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

variable = "subnet-azs" {
    type = list(string)
    description = "availability zones for the subnets"
    default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "private-cidr" {
    type = list(string)
    description = "cidr block for the private subnets"
    default = ["192.168.48.0/20", "192.168.60.0/20", "192.168.72.0/20"]
}

variable "public-cidr" {
    type = list(string)
    description = "cidr block for the public subnets"
    default = ["192.168.0.0/20", "192.168.12.0/20", "192.168.24.0/20"]

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

variable "dns_hostnames" {
    type = bool
    description = "enable dns hostnames"
    default = true
}

variable "dns_support" {
    type = bool
    description = "enable dns support"
    default = true
}

variable "nat" {
    type = bool
    description = "enable single nat gateway"
    default = false
}