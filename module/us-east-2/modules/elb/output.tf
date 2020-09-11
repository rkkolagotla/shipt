output "this_elb_id" {
  description = "The name of the ELB"
  value       = concat(aws_elb.this.*.id, [""])[0]
}

output "this_elb_arn" {
  description = "The ARN of the ELB"
  value       = concat(aws_elb.this.*.arn, [""])[0]
}

output "this_elb_name" {
  description = "The name of the ELB"
  value       = concat(aws_elb.this.*.name, [""])[0]
}

output "this_elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = concat(aws_elb.this.*.dns_name, [""])[0]
}

output "this_elb_instances" {
  description = "The list of instances in the ELB"
  value       = flatten(aws_elb.this.*.instances)
}
