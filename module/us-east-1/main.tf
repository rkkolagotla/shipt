provider "aws" {
  region = "us-east-1"
}

###############################
#Security group and Access Key
###############################

module "access_key" {
 source = "./modules/common"
}

############################################
# Launch configuration and autoscaling group
############################################

module "launch_asg" {
  source = "./modules/autoscaling"

  lc_name = "my-lc"
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  load_balancers  = [module.launch_elb.this_elb_id]

  ebs_block_device = [
    {
      device_name           = "/dev/sde"
      volume_type           = "gp2"
      volume_size           = "8"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "8"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "my-asg"
  vpc_zone_identifier       = ["subnet-1771", "subnet-7c8e3f"]
  health_check_type         = "EC2"
  min_size                  = 2 
  max_size                  = 2 
  desired_capacity          = 2
  wait_for_capacity_timeout = 0

  depends_on = [module.access_key]

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "megasecret"
      propagate_at_launch = true
    },
  ]
}

######
# ELB
######
module "launch_elb" {
  source = "./modules/elb"

  name = "elb-test"

  subnet_ids         = ["subnet-72fc8e3f", "subnet-17842671"]

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }
  
  depends_on = [module.access_key]

  tags = {
   Name = "test-elb"
  }

}

##########
#Redis
##########
module "redis" {
  source = "./modules/redis"

  subnet_ids           = ["subnet-17842671"]
}
