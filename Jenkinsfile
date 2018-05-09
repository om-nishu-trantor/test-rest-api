pipeline {
     agent any
     
     triggers {
          pollSCM('H/10 * * * 1-5')
     }
     stages {
         stage('checkout Project') {
             steps {
                checkout scm
                sh 'bash build.sh'
             }             
         }

         stage('Build Project') {
             steps {
                 sh 'echo "Start Build Project"'
             }
         }

         stage('Deploy - Develop') {
             when {
               branch "develop"
            }
             steps {
                 sh 'echo deploying $APP_NAME to production'
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

     environment {
        APP_NAME = 'my-app'
     }
}
