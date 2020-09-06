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

Usage
------
To run this example you need to execute:

$ terraform init
$ terraform plan
$ terraform apply

Note: This example may create resources which cost money. Run terraform destroy when you don't need these resources.
