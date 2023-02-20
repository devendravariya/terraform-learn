output "vpc_id" {
  description = "ID of project VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "CIDR of project VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "Public subnets IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnets IDs"
  value       = module.vpc.private_subnets
}

output "public_subnet_cidrs" {
  description = "Public subnets CIDRs"
  value       = module.vpc.public_subnet_cidrs
}

output "private_subnet_cidrs" {
  description = "Private subnets CIDRs"
  value       = module.vpc.private_subnet_cidrs
}

output "public_subnet_azs" {
  description = "Public subnets AZs"
  value       = module.vpc.public_subnet_availability_zones
}

output "private_subnet_azs" {
  description = "Private subnets AZs"
  value       = module.vpc.private_subnet_availability_zones
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = module.vpc.igw_id
}

output "nat_gw_ids" {
  description = "NAT Gateway IDs"
  value       = module.vpc.nat_gw_ids
}

output "nat_gw_eips" {
  description = "NAT Gateway EIPs"
  value       = module.vpc.nat_gw_eips
}

output "private_route_table_ids" {
  description = "Private route table IDs"
  value       = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "Public route table IDs"
  value       = module.vpc.public_route_table_ids
}
