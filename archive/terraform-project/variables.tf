variable "aws_region" {
  default = "eu-west-2"
}
variable "ami_id" {
  default = "ami-0eb260c4d5475b901"
}
variable "instance_type" {
  default = "t3.small"
}
variable "instance_count" {
  type    = number
  default = 2
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}
variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}