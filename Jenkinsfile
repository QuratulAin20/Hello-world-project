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
                sh 'docker build -t hello-world:2.0 https://github.com/QuratulAin20/Hello-world-project.git'
                }
            }

        stage('Push Docker Image') {
            steps {
                //tagging docker image
                sh 'docker tag hello-world:2.0 eagledock/hello-world'
                // Push docker image to a container registry (docker hub)
                sh 'docker push eagledock/hello-world'
            }
        }
    }
}

