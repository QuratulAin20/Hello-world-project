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
                // Navigate to the repository directory
                cd('Hello-world-project') {
                    // Build the Docker image using the Dockerfile
                    sh 'docker build -t my-app-hello-world:1.0 .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push docker image to a container registry (docker hub)
                sh 'docker push my-app-hello-world:1.0'
            }
        }
        stage('Deploy to aws') {
            steps {
                // Use SSH to connect to aws EC2 instance and run deployment script 
                // Replace place holder with SSH key, instance IP or etc.
                sh 'ssh -i C:/Users/DELL/Downloads/teamcity.pem ubuntu@43.206.192.71 "bash -s" < deploy-script.sh'
            }
        }
    }
}
