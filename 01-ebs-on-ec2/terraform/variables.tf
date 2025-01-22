variable "volume_size" {
  description = "The size of the EBS volume in GiB"
  type        = number
  default     = 100
}

variable "availability_zone" {
  description = "The availability zone in which the EBS volume will be created"
  type        = string
}

variable "instance_id" {
  description = "The ID of the EC2 instance to which the EBS volume will be attached"
  type        = string
}

variable "region" {
  description = "The AWS region in which the EBS volume will be created"
  type        = string
}
