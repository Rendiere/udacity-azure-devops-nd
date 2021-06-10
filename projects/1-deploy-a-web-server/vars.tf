variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "udacity"
}

variable "tags" {
  description = "Tags applied to resources"
  default = {
    "udacity": "project-1"
  }
}

variable "resource_group_name" {
  description = "The resource group to be used"
  default = "udacity-project-1"
}

# TF_VAR_subscription_id
variable "subscription_id" {}

# TF_VAR_tenant_id
variable "tenant_id" {}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "UK South"
}

variable "username" {
  description = "Username for the Virtual Machine"
  default = "renierbotha"
}

variable "password" {
  description = "Password for the Virtual Machine"
  default = "UdacityAzureNanodegree9000"
}

variable "vm_count_min" {
  default = 2
  description = "The min number of VMs to be used when scaling up the load balancer"
}
