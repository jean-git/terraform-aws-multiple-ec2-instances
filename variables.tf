variable "aws_region" {
  description = "EC2 Region"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.nano"
}

variable "key_name" {
  description = "EC2 Key Name"
  default     = "aws-key-us-west-2" ### Please replace it to you key pair name ####
}