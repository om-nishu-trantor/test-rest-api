pipeline {
     
     properties {
          checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/om-nishu-trantor/test-rest-api.git']]])
     }

     agent any

     stages {
         stage('checkout Project') {
             steps {
                checkout scm
                sh 'echo "Start Checkout Project"'
             }             
         }

         stage('Build Project') {
             steps {
                 sh 'echo "Start Build Project"'
             }
         }
          
         stage('Run Test') {
             steps {
                 sh 'echo "Start Test Project"'
             }
         }

         stage('Deploy - Develop') {
             when {
               branch "develop"
            }
             steps {
                 sh 'echo deploying $APP_NAME to development'
             }             
         }
          
         stage('Deploy - QA') {
             when {
               branch "qa"
            }
             steps {
                 sh 'echo deploying $APP_NAME to production'
             }             
         }

         stage('Deploy - Production') {
             when {
               branch "master"
            }
             steps {
                 sh 'echo deploying $APP_NAME to production'
             }             
         }
     }
     
     post {
         
          success {
               mail to: 'nishutosh.sharma@trantorinc.com',
                    subject: "The pipeline ${currentBuild.fullDisplayName} completed successfully",
                    body: "The pipeline ${currentBuild.fullDisplayName} completed successfully."
          }
          
          failure {
               mail to: 'nishutosh.sharma@trantorinc.com',
                    subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                    body: "Something is wrong with ${env.BUILD_URL}"
          }
     }

     environment {
        APP_NAME = 'demo1'
     }
}
