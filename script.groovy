def buildTar(){
    echo "Building application tar file"
    //Remove app directory if it already exists
    sh 'chmod 755 createTar.sh' 
    sh './createTar.sh'
}//buildTar

def createAWSInfra(){
    echo "Creating required AWS resources"
    sh 'cd tf_scripts'
    sh 'terraform init'
    sh 'terraform plan'
    sh 'terraform apply --auto-approve'    
}//createAWSInfra

return this