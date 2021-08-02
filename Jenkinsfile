def gv
pipeline {
    agent any
    //Maven is installed as a plugin and hence will not be available scripted pipeline, hence we have to add tools block to make it available
    tools {

    }//tools
    
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
    }//stages
}//pipeline