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
	SECRET = credentials('SECRET')
    }
    stages {
        stage('pre-build') { 
            steps {
                sh 'npm install' 
		sh 'npm test'
            }
        }
	stage ('Initialize') {
	    steps {
	        def dockerHome = tool 'docker'
	        env.PATH = "${dockerHome}/bin/:${env.PATH}"
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
		    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_creds') {
		        app.push('jenkins')
		    }
		}
	    }
	}
    }
}
