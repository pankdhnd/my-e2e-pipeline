//fetching instace id of the terraform AMI I created in my account
output "aws_instance_id" {
  value =  data.aws_instance.instance_id.id
}