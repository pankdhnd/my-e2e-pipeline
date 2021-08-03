def buildTar(){
    echo "Building application tar file"
    //Remove app directory if it already exists
    sh 'chmod 755 createTar.sh' 
    sh './createTar.sh'
}//buildTar

def createAWSInfra(){
    echo "Creating required AWS resources"
    sh 'chmod 755 terraform.sh'
    sh './terraform.sh'
}//createAWSInfra

def deployServer(){
    echo "Deploying server"
    sh 'ansible-playbook -i inventory_aws_ec2.yaml app-playbook.yaml'
}

return this