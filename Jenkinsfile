pipeline {
    agent {
        docker {
            image 'node:12-buster-slim' 
            args '-p 3000:3000' 
        }
    }
    environment {
        TEST_PORT = 3001
	TEST_MONGODB_URI = credentials('MONGODB_URI')
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
		sh 'npm test'
            }
        }
    }
}
