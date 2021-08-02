def gv
pipeline {
    agent any
    //Maven is installed as a plugin and hence will not be available scripted pipeline, hence we have to add tools block to make it available
    tools {

    }//tools
    
    stages{
        stage("init"){
            steps{
                gv = load "script.groovy"
            }//steps
        }//init stage
        stage("Build Application"){
            steps{
                gv.buildTar()
            }
        }
    }//stages
}//pipeline