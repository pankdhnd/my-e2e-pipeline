def buildTar(){
    echo "Building application tar file"
    sh 'mkdir app'
    sh 'cp -R public views app.js package.json app'
    sh 'tar -czvf app.tar.gz app'
    sh 'rm -f app'
}//buildTar

return this