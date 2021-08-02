def buildTar(){
    echo "Building application tar file"
    //Remove app directory if it already exists
    sh 'rm -r app' 
    sh 'mkdir app'
    sh 'cp -R public views app.js package.json app'
    //remove tar file if it already exists
    sh 'rm app.tar.gz'
    sh 'tar -czvf app.tar.gz app'
    sh 'rm -rf app'
}//buildTar

return this