def gv
def EC2_PUBLIC_IP
pipeline {
    agent any
    /*tools {
        //maven 'apache-maven-3.0.1' 
        SonarQube Scanner 'SonarQubeScanner'
    }*/
    //Maven is installed as a plugin and hence will not be available scripted pipeline, hence we have to add tools block to make it available   
    stages{
        stage("init"){
            steps{
                script {
                    gv = load "script.groovy"
                }//script             
            }//steps
        }//init stage
        stage("SonarQube Scan"){
            steps{
                script {
                          env.JAVA_HOME="${tool 'openjdk_11_0_12'}"
                          env.PATH="${env.JAVA_HOME}/bin:${env.PATH}"
                          def scannerHome = tool 'SonarQubeScanner';
                          withSonarQubeEnv() {
                          sh "${scannerHome}/bin/sonar-scanner"
                      }
               }//script         
            }//steps
        }//stage SonarQube Scan        
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
                    }                    
                }//script         
            }//steps
        }//stage Create AWS Infrastructure
        stage("Deploy Application"){
            steps{
                script {                           
                            withCredentials([sshUserPrivateKey(credentialsId: 'ec2-private-key', keyFileVariable: 'keyFile', username: 'user' )]){
                              sh "chmod 755 copyKey.sh"                             
                              sh "./copyKey.sh ${keyFile}"
                            }     
                            dir('ansible_scripts'){                                                
                            gv.deployServer()
                        }                    
                }//script         
            }//steps
        }//stage Deploy Application
        stage("Publish Application URL"){
            steps{
                script {
                    appurl = "http://${EC2_PUBLIC_IP}:3000"                        
                    appurl = appurl.replace('"',"")
                    println "Application URL: ${appurl}"             
                }//script         
            }//steps
        }//stage Publish Application URL
    }//stages
}//pipeline