pipeline {
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
             mail to: 'dilkhush.soni@trantorinc.com',
                  subject: "$DEFAULT_SUBJECT",
                  body: "$DEFAULT_CONTENT"
         }
     }

     environment {
        APP_NAME = 'my-app'
     }
}
