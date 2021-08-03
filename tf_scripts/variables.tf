variable aws_profile {
  type        = string
  default     = "default"
}

variable env_prefix {
  type        = string
  default     = "test"
  description = "environment prefix to be used in tags"
}

variable region {
  type        = string
  default     = "ap-south-1"
  description = "AWS region"
}

variable instanceType {
  type        = string
  default     = "t2.micro"
}

variable keyName {
  type        = string
  default     = "tf-study"
}

variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
}

variable subnet_cidr {
  type        = string
  default     = "10.0.1.0/24"
}

variable subnet_az {
  type        = string
  default     = "ap-south-1a"
}

variable public_cidr {
  type        = string
  default     = "0.0.0.0/0"
}

variable my_ip {
  type        = string
  default     = "182.70.4.116/32"
}

variable jenkins_ip {
  type        = string
  default     = "3.108.251.122/32"
}


locals {
  common_tags = {
    Name = "${var.env_prefix}-app"
  }
}