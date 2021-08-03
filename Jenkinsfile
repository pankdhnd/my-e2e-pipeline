def gv
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
                        def EC2_PUBLIC_IP = ""
                        gv.createAWSInfra()
                        echo "Public IP is ${EC2_PUBLIC_IP}"
                    }                    
                }//script         
            }//steps
        }//stage Create AWS Infrastructure
    }//stages
}//pipeline