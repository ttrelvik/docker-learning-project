pipeline {
    agent {
        docker {
            // Use the currently maintained official Docker image
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build Image') {
            steps {
                echo 'Building the custom nginx image...'
                sh 'docker build -t my-custom-nginx .'
            }
        }
        stage('Deploy with Compose') {
            steps {
                echo 'Deploying nginx container via Docker Compose...'
                sh 'docker compose up -d'
            }
        }
    }
}
