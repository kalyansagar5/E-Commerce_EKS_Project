variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string

  validation {
    condition     = can(regex("^vpc-[a-zA-Z0-9]+$", var.vpc_id))
    error_message = "vpc_id must be a valid AWS VPC ID."
  }
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "project-node-group"
}
