module "ec2_instance" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = var.instance_name
    instance_count = 1
    ami = var.ami
    instance_type = var.instance_type
    key_name = resource.aws_key_pair.kp.key_name
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_group_ids = [aws_security_group.bitbucket_sg.id, aws_security_group.ssh.id]
    associate_public_ip_address = true
    monitoring = true
    root_block_device = [
        {
        volume_type = "gp2"
        volume_size = 8
        delete_on_termination = true
        }
    ]
    userdata = ./userdata.sh
    tags = {
        Name = "bitbucket"
        Environment = "dev"
    }
}
resource "aws_eip" "lb" {
  instance = module.ec2_instance.this_instance_id
  vpc      = true
}