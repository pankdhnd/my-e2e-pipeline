def buildTar(){
    echo "Building application tar file"
    //Remove app directory if it already exists
    sh 'chmod 755 createTar.sh' 
    sh './createTar.sh'
}//buildTar

def createAWSInfra(){
    echo "Creating required AWS resources"
    sh 'terraform init'
    sh 'terraform plan'
    sh 'terraform apply --auto-approve'
    EC2_IP = sh (
        script: "terraform output ec2_public_ip"
        returnStdout: true
    )
    return EC2_IP
}//createAWSInfra

return this