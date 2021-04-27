pipeline {
    agent {
        docker {
            image 'node:12.22-buster-slim'
            args '-p 3001:3001'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'    
            }
        }
    }
}