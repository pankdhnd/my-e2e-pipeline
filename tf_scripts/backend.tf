terraform{
    backend "s3" {
      profile = "test"
      shared_credentials_file = "~/.aws/credentials"
      bucket = "pipeline1-remote-backend"
      key = "terraform.tfstate"
      region = "ap-south-1"
      dynamodb_table = "app-s3-tf-state-lock"      
    }    
}