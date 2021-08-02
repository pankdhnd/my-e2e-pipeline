data "aws_ami" "ami_id" {
  most_recent = true
  //owners = ["amazon"]

  filter {
    name   = "name"
    values = ["*ubuntu-focal*"]
  }
}