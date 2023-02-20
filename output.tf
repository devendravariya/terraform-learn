output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnet_cidr_blocks" {
  description = "The CIDR blocks of the public subnets"
  value       = module.vpc.public_subnet_cidr_blocks
}

output "private_subnet_cidr_blocks" {
  description = "The CIDR blocks of the private subnets"
  value       = module.vpc.private_subnet_cidr_blocks
}

output "public_subnet_availability_zones" {
  description = "The availability zones of the public subnets"
  value       = module.vpc.public_subnet_availability_zones
}

output "private_subnet_availability_zones" {
  description = "The availability zones of the private subnets"
  value       = module.vpc.private_subnet_availability_zones
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

output "nat_gateway_ids" {
  description = "The IDs of the NAT Gateways"
  value       = module.vpc.nat_gw_ids
}

output "nat_gateway_eips" {
  description = "The Elastic IPs of the NAT Gateways"
  value       = module.vpc.nat_gw_eips
}

output "private_route_table_ids" {
  description = "The IDs of the private route tables"
  value       = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "The IDs of the public route tables"
  value       = module.vpc.public_route_table_ids
}
