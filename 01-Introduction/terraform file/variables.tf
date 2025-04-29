variable "aws_region" {
  type    = string
  default = "us-east-2"  #Change to Your Region
}

variable "my_instance_type1" {
  type    = string
  default = "t2.medium"
}
 
variable "my_instance_type" {
  type    = string
  default = "t2.micro"
}


variable "my_key" {
  type    = string
  default = "devopskey" # Change your Key Name
}

variable "os" {
  type    = string
  default = "linux"
}