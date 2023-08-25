pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull code from the Git repository
                sh 'git clone https://github.com/QuratulAin20/Hello-world-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                    // Build the Docker image using the Dockerfile
                    sh 'docker build -t my-app-hello-world:1.0 https://github.com/QuratulAin20/Hello-world-project.git'
                }
            }

        stage('Push Docker Image') {
            steps {
                //tagging docker image
                sh 'docker tag my-app-hello-world eagledock/jenkins:1.0'
                // Push docker image to a container registry (docker hub)
                sh 'docker push my-app-hello-world:1.0'
            }
        }
    }
}

