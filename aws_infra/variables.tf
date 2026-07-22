variable "my-env" {
    description = "this is the environment for infra"
  type = string
}

variable "ami_id" {
description = "thi is the ami id for ec2"
type = string
}
variable "instance_type" {
    description = "This id the type of instance for EC2"
    type = string
  
}
variable "instance_count" {
    description = "This is the count of instance EC2"
    type = number
  
}