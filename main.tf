# module "jenkins" {
#   source  = "terraform-aws-modules/ec2-instance/aws"

#   name = "jenkins-tf"

#   instance_type          = "t3.small"
#   vpc_security_group_ids = ["sg-041230b4c117faef1"] #replace your SG
#   subnet_id = "subnet-011db0e86526ce613" #replace your Subnet
#   ami = data.aws_ami.ami_info.id
#   user_data = file("jenkins.sh")
#   tags = {
#     Name = "jenkins-tf"
#   }
# }

module "k3s_cluster" {
  source  = "cruxstack/k3s/aws"
  version = ">= 0.8.0"

  name                    = "example"
  k3s_admin_allowed_cidrs = ["10.0.0.0/32"]

  k3s_server_instances = {
    count            = 1
    assign_public_ip = true
    vpc_subnet_ids   = ["subnet-0695b9ec84837197b","subnet-0325e5d5b25914a6d"]
  }

  k3s_agent_instances = {
    count            = 1
    assign_public_ip = true
    vpc_subnet_ids   = ["subnet-0695b9ec84837197b","subnet-0325e5d5b25914a6d"]
  }
}

# module "jenkins_agent" {
#   source  = "terraform-aws-modules/ec2-instance/aws"

#   name = "jenkins-agent"

#   instance_type          = "t3.small"
#   vpc_security_group_ids = ["sg-041230b4c117faef1"] #replace your SG
#   subnet_id = "subnet-011db0e86526ce613" #replace your Subnet
#   ami = data.aws_ami.ami_info.id
#   user_data = file("jenkins-agent.sh")
#   root_block_device = [
#     {
#       volume_type = "gp3"
#       volume_size = 50
#     }
#   ]
#   tags = {
#     Name = "jenkins-agent"
#   }
# }




# module "records" {
#   source  = "terraform-aws-modules/route53/aws//modules/records"
#   version = "~> 2.0"

#   zone_name = data.aws_route53_zone.sainathdevops.name

#   records = [
#     {
#       name    = "jenkins"
#       type    = "A"
#       ttl     = 1
#       records = [
#         module.jenkins.public_ip
#       ]
#       allow_overwrite = true
#     },
#     {
#       name    = "jenkins-agent"
#       type    = "A"
#       ttl     = 1
#       records = [
#         module.jenkins_agent.private_ip
#       ]
#       allow_overwrite = true
#     }
#     # {
#     #   name    = "nexus"
#     #   type    = "A"
#     #   ttl     = 1
#     #   allow_overwrite = true
#     #   records = [
#     #     module.nexus.public_ip
#     #   ]
#     #   allow_overwrite = true
#     # }
#   ]

# }