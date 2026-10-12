variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "vpc_security_group_ids" {
    type = list(string)
}
variable "instance_name" {
  type = string
}
variable "subnet_id" {}