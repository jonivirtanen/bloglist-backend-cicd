pipeline {
    agent any
    environment {
        TEST_PORT = 3001
        TEST_MONGODB_URI = credentials('MONGODB_URI')
        SECRET = credentials('SECRET')
    }
    stages {
        stage('pre-build') { 
            steps {
                nodejs(nodeJSInstallationName: 'Node 12.22.1') {
                    sh 'npm install' 
                    sh 'npm test'
                }
            }
        }
        stage('build docker image') { 
            steps {
                script {
                    app = docker.build('vijoni/bloglist-backend-cicd:jenkins')
                }
             }
        }
        stage('push docker image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-creds') {
                        app.push('jenkins')
                    }
                }
            }
        }
    }
}

