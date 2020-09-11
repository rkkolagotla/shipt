Shipt Project
---------------

------------------------------------------------------------------------------
|Tools:
|-------
|AWS + Terraform + Docker + ShellScripting + Git
-------------------------------------------------------------------------------

Auto Scaling Group with ELB and Redis
--------------------------------------
Configuration in this directory creates Launch Configuration, Auto Scaling Group, Elastic Load Balancer, Redis and places Auto Scaling EC2 instances under ELB and places Redis in private subnet.

How To Run:
-----------

To run this you need to execute:

$ terraform init

$ terraform plan

$ terraform apply --auto-approve

Note: This may create resources which cost money. Run "terraform destroy --auto-approve" when you don't need these resources.

VPC:
----
--> First create VPC with 2 public and 2 private subnets and place then in 2 avaiblility zones
   
    Ex: private-a  us-east-2a
        private-b  us-east-2b
   
        public-a   us-east-2a
        public-b   us-east-2b
        
--> Enable DNS Hostnames in VPC Actions tab and then got to subnets and select public subnets and modify ip assign settings from Action tab and select Auto Assign IP4. This enables public ip and DNS names for only public instance.
 
--> Create 2 Route Tables public and private and point subnets accordingly

--> Create Internet Gateway and add in public route table

--> Create NAT Gateway and point to any one public subnet and then add NAT Gateway in private route table.

EC2:
---- 

--> Go to "ec2_instance" folder and lanch EC2 instance in public subnet(modify variables accoring to your VPC subnet details) 

Auto Scaling and ELB:
---------------------

--> main.tf is main module file for auto scaling group and elb

--> files are in modules/autoscaling and modules/elb

--> we need to update EC2 instance id in ELB variables and modfy the rest of the details according to your VPC and your autoscaling group size

--> This will launch autoscaling group and elb and attach autoscaling group to elb and attach the ec2 instance to elb as well

Redis:
------

--> main.tf file creates redis DB as well

--> files are in modules/redis folder and variables needs to be modified according to your req. 

How TO Test:
-------------

--> once creation part is complete, copy ELB DNS url and paste it in browser and refresh continously. you will see different response from public and private instance. 

   Ex: 
             
       Deployed via Terraform..Private Instance
       ip-10-0-0-21
       
       Deployed via Terraform..Public Instance
       ip-10-0-0-61
       
  --> You can SSH in to Public instance by using public ip but you can't SSH to private instance diectly because you won't get public ip for private instances.

<b>Note: All files need to be modify according to your VPC details and update variables accordingly.<b>

<b>Updated Logic for Two Regions.<b>
