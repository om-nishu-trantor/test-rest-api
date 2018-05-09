pipeline {
     agent any
     
     scm {
          git {
               remote {
                    github('om-nishu-trantor/test-rest-api')
                    refspec('+refs/pull/*:refs/remotes/origin/pr/*')
               }
               branch('${sha1}')
          }
     }
     
     triggers {
          pollSCM('H/10 * * * 1-5')
          githubPullRequest {
               admin('nishutosh')
               admins(['nishutosh'])
               cron('H/2 * * * *')
               triggerPhrase('OK to test')
               onlyTriggerPhrase()
               useGitHubHooks()
               permitAll()
               autoCloseFailedPullRequests()
               allowMembersOfWhitelistedOrgsAsAdmin()
               extensions {
                    commitStatus {
                         context('deploy to staging site')
                         triggeredStatus('starting deployment to staging site...')
                         startedStatus('deploying to staging site...')
                         completedStatus('SUCCESS', 'All is well')
                         completedStatus('FAILURE', 'Something went wrong. Investigate!')
                         completedStatus('PENDING', 'still in progress...')
                         completedStatus('ERROR', 'Something went really wrong. Investigate!')
                    }
               }
          }
     }
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
