pipeline {
    agent any
    
    environment {
        // Fetches your secure keys stored securely within the Jenkins Credential Store
        AWS_CREDS = credentials('aws-assignment-credentials') 
    }
    
    stages {
        stage('Pull Source Code') {
            steps {
                checkout scm
            }
        }
        
        stage('Terraform Initialization') {
            steps {
                withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_CREDS_USR}", "AWS_SECRET_ACCESS_KEY=${env.AWS_CREDS_PSW}"]) {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Syntax Validation') {
            steps {
                sh 'terraform validate'
            }
        }
        
        stage('Execution Planning') {
            steps {
                withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_CREDS_USR}", "AWS_SECRET_ACCESS_KEY=${env.AWS_CREDS_PSW}"]) {
                    sh 'terraform plan'
                }
            }
        }
        
        stage('Apply Changes') {
            steps {
                // Production safe-guard: requires a human manager to click "Proceed" in Jenkins UI before running apply
                input message: 'Deploy these infrastructure updates to AWS?', ok: 'Proceed'
                
                withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_CREDS_USR}", "AWS_SECRET_ACCESS_KEY=${env.AWS_CREDS_PSW}"]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
