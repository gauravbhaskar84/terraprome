# AWS Config

variable "aws_access_key" {
# This is not required and can be commented, if access key is configured as default in .aws/credentials.
  default = "<AWS_ACCESS_KEY>"
}

variable "aws_secret_key" {
# This is not required and can be commented, if secret key is configured as default in .aws/credentials.
  default = "<SECRET_KEY>"
}

variable "aws_region" {
# This is not required and can be commented, if region is configured as default in .aws/credentials or .aws/config.
  default = "eu-central-1"
}

variable "key_name" {
# the key that will be used to connect ec2 instances  
  default = "<key_name>"
}

variable "vpc_id" {
# This can be set here or can be given while running terraform plan or terraform apply
  default = "<VPC_ID>"
# I used 10.y.0.0/16 for the test case
}

variable "subnet_id" { 
# This Subnet ID could be a Private One which has a Route through Nat Gateway, it should be a part of the VPC mentioned above
  default = "<PRIVATE_SUBNET_ID>"
# I used the subnet ID which has 10.y.0.0/25
}

variable "instance_type" { 
# t2.micro was picked for the test case. We can change it here.
  default = "<INSTANCE_TYPE>" 
}

variable "instance_username" {
# default username to perform necessary operation on an ec2 instance
  default = "ubuntu"
}

variable "private_key_path" {
# please set the path where you have kept the private key along with the key name, this is required to connect and install prometheus server on an ec2 instance
  default = "<Path of the Private Key Stored>"
}
