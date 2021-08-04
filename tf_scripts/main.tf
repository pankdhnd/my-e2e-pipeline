//Create VPC
resource "aws_vpc" "app_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
}

//Create subnets within vpc
resource "aws_subnet" "app_subnet" {
  vpc_id     = aws_vpc.app_vpc.id
  availability_zone = var.subnet_az  
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = local.common_tags
}

//Create internet gateway
resource "aws_internet_gateway" "internet_gate" {
  vpc_id = aws_vpc.app_vpc.id
  tags = local.common_tags
}

//Associate internet gateway with default route table in vpc
resource "aws_default_route_table" "default_route_table"{
  default_route_table_id = aws_vpc.app_vpc.default_route_table_id
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gate.id
    }
  tags = local.common_tags
}

/*
//Create route table
resource "aws_route_table" "my_route_table"{
    vpc_id     = aws_vpc.app_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gate.id
    }
    tags = local.common_tags
}

//Associate route table with subnet
resource "aws_route_table_association" "routetable-subnet"{
  subnet_id = subnet_id = aws_subnet.app_subnet.id
  my_route_table_id = aws_route_table.my_route_table.id 
}

*/


//Create EC2 instance
resource "aws_instance" "app_ec2" {
    ami = data.aws_ami.ami_id.id
    instance_type = var.instanceType
    subnet_id = aws_subnet.app_subnet.id
    security_groups = [aws_security_group.ec2_security_group.id]
    tags = local.common_tags
    key_name = var.keyName
}


//Create security group for EC2
resource "aws_security_group" "ec2_security_group" {
    vpc_id = aws_vpc.app_vpc.id
    ingress {
    description      = "Allow HTTP traffic"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = [var.public_cidr]
  }
  ingress {
    description      = "Allow SSH from my ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.my_ip,var.jenkins_ip]
  }
  egress {
    description      = "Allow outboud connection to anywhere"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.public_cidr]
  }
  tags = local.common_tags
}