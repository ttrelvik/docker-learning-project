pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker build -t my-custom-nginx .'
            }
        }
        stage('Test') {
            steps {
                echo 'Running the container for a quick test...'
                sh 'docker run --name my-test-server -d -p 8080:80 my-custom-nginx'
                // Wait a few seconds for the server to start
                sh 'sleep 5'
                // Use curl to check if the server is responding
                sh 'curl http://localhost:8080'
            }
        }
    }
    post {
        always {
            echo 'Stopping and removing the test container...'
            // Use || true to prevent the build from failing if the container doesn't exist
            sh 'docker stop my-test-server || true'
            sh 'docker rm my-test-server || true'
        }
    }
}
