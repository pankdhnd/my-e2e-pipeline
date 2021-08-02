//fetching instace id of the terraform AMI I created in my account
output "ami_id" {
  value =  data.aws_ami.ami_id.id
}

output "ec2_public_ip" {
  value = aws_instance.app_ec2.public_ip
}