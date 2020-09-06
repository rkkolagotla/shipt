variable "name" {
  description = "Default subnet group name"
  type        = string
  default     = "private"
}

variable "subnet_ids" {
  description = "list of subnets to launch redis cluster"
  type        = list(string)
}
  
variable "cluster_id" {
  description = "Id to assign the new cluster"
  type        = string
  default     = "redis-cluster"
}

variable "sec_grp" {
  type        = list(string)
  default     = ["mysecgrp"]
}

variable "node_groups" {
  description = "Number of nodes groups to create in the cluster"
  default     = 1 
}
