def gv
def EC2_PUBLIC_IP
pipeline {
    agent any
    //Maven is installed as a plugin and hence will not be available scripted pipeline, hence we have to add tools block to make it available
   
    stages{
        stage("init"){
            steps{
                script {
                    gv = load "script.groovy"
                }//script             
            }//steps
        }//init stage
        stage("Build Application"){
            steps{
                script {
                    gv.buildTar()
                }//script         
            }//steps
        }//stage Build Application
        stage("Create AWS Infrastructure"){
            steps{
                script {
                    dir('tf_scripts'){                        
                        EC2_PUBLIC_IP = gv.createAWSInfra()
                        //echo "Public IP is ${EC2_PUBLIC_IP}"
                    }                    
                }//script         
            }//steps
        }//stage Create AWS Infrastructure
        stage("Deploy Application"){
            steps{
                script {                           
                            withCredentials([sshUserPrivateKey(credentialsId: 'ec2-private-key', keyFileVariable: 'keyFile', username: 'user' )]){
                              sh "chmod 755 copyKey.sh"     
                              sh "cp ${keyfile} ~/.ssh/ec2key.pem"                         
                              //sh "./copyKey.sh ${keyFile}"
                            }     
                            dir('ansible_scripts'){                                                
                            gv.deployServer()
                        }                    
                }//script         
            }//steps
        }//stage Create AWS Infrastructure
    }//stages
}//pipeline