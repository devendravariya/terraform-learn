output "cloudflare_sg_id" {
    value = "aws_security_group.cloudflare.id"
}
output "cloudflare_sg_name" {
    value = "aws_security_group.cloudflare.name"
}
output "cloudflare_sg_arn" {
    value = "aws_security_group.cloudflare.arn"
}
output "cloudflare_sg_description" {
    value = "aws_security_group.cloudflare.description"
}
output "security_group_vpc_id" {
    value = "aws_security_group.cloudflare.vpc_id"
}
output "cloudflare_sg_ingress" {
    value = "aws_security_group.cloudflare.ingress"
}
output "cloudflare_sg_egress" {
    value = "aws_security_group.cloudflare.egress"
}
output "cloudflare_sg_owner_id" {
    value = "aws_security_group.cloudflare.owner_id"
}
output "cloudflare_sg_tags" {
    value = "aws_security_group.cloudflare.tags"
}
output "bitbucket_sg_id" {
    value = "aws_security_group.bitbucket_sg.id"
}  
output "bitbucket_sg_name" {
    value = "aws_security_group.bitbucket_sg.name"
}
output "bitbucket_sg_arn" {
    value = "aws_security_group.bitbucket_sg.arn"
}
output "bitbucket_sg_description" {
    value = "aws_security_group.bitbucket_sg.description"
}
output "bitbucket_sg_vpc_id" {
    value = "aws_security_group.bitbucket_sg.vpc_id"
}
output "e2_instance_id" {
    value = "module.ec2_instance.this_instance_id"
}
output "e2_instance_ami" {
    value = "module.ec2_instance.this_instance_ami"
}
output "e2_instance_arn" {
    value = "module.ec2_instance.this_instance_arn"
}
output "e2_instance_availability_zone" {
    value = "module.ec2_instance.this_instance_availability_zone"
}
output "e2_instance_cpu_core_count" {
    value = "module.ec2_instance.this_instance_cpu_core_count"
}
output "e2_instance_cpu_threads_per_core" {
    value = "module.ec2_instance.this_instance_cpu_threads_per_core"
}

output "e2_instance_ebs_block_device" {
    value = "module.ec2_instance.this_instance_ebs_block_device"
}
output "e2_instance_ebs_optimized" {
    value = "module.ec2_instance.this_instance_ebs_optimized"
}
output "ec2_instance_instance_state" {
    value = "module.ec2_instance.this_instance_instance_state"
}
output "ec2_instance_instance_type" {
    value = "module.ec2_instance.this_instance_instance_type"
}
output "ec2_instance_ip4_address" {
    value = "module.ec2_instance.this_instance_ip4_address"
}