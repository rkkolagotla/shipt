# Launch configuration
output "this_launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = module.launch_asg.this_launch_configuration_id
}

# Autoscaling group
output "this_autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = module.launch_asg.this_autoscaling_group_id
}

#ELB
output "this_elb_id" {
  description = "The name of the ELB"
  value       = module.launch_elb.this_elb_id
}

output "this_elb_arn" {
  description = "The ARN of the ELB"
  value       = module.launch_elb.this_elb_arn
}

output "this_elb_name" {
  description = "The name of the ELB"
  value       = module.launch_elb.this_elb_name
}

output "this_elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = module.launch_elb.this_elb_dns_name
}

output "this_elb_instances" {
  description = "The list of instances in the ELB"
  value       = module.launch_elb.this_elb_instances
}

#Redis
#output "configuration_endpoint_address" {
#  value = module.redis.configuration_endpoint_address
#}

#output "primary_endpoint_address" {
#  value = module.redis.primary_endpoint_address
#}
