data "aws_ami" "ami_id" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["*ubuntu-focal-*-amd64*"]
  }
}