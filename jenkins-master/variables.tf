variable "vpc_id" {
    description = "The vpc id to use"
}

variable "subnet_id" {
    description = "the subnet id to use"
}

variable "availability_zone" {
    description = "the az to use"
} 

variable "key_name" {
    description = "the ssh key to use"
}

variable "instance_type" {
    description = "the instance type to use for jenkins"
    default = "t2.small"
}
