variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "private_subnets" {
  description = "Private Subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public Subnets"
  type        = list(string)
}

variable "azs" {
  description = "Avaliablity Zones"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "key_pair" {
  description = "Key Pair"
  type        = string
}

variable "s3_bucket" {
  description = "S3 Bucket"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}
