def buildTar(){
    echo "Building application tar file"
    //Remove app directory if it already exists
    sh 'chmod 755 createTar.sh' 
    sh './createTar.sh'
}//buildTar

return this