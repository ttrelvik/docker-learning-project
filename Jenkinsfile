pipeline {
    // Run this pipeline inside a container that has the Docker CLI
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build Image') {
            steps {
                echo 'Building the custom nginx image...'
                // Build the image using the local Dockerfile
                sh 'docker build -t my-custom-nginx .'
            }
        }
        stage('Deploy with Compose') {
            steps {
                echo 'Deploying nginx container via Docker Compose...'
                // Use Docker Compose to run the container with all the Traefik labels
                sh 'docker compose up -d'
            }
        }
    }
    post {
        always {
            echo 'Deployment complete. Container is managed by Docker Compose.'
            // No cleanup needed here, as we want the container to keep running.
        }
    }
}
