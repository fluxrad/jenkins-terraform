variable "vpc_id" {
    description = "The vpc id"
    default = "<YOUR VPC HERE>"
}

variable "key_name" {
    description = "The SSH key"
    default = "<YOUR SSH KEY>"
}

variable "vpc_subnets" {
    description = "The vpc subnet ids to use"
    default = {
      us-east-1a = "<SUBNET 1a ID>"
      us-east-1b = "<SUBNET 1b ID>"
    }
}
