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
        stage('Deploy on EC2') {
            steps {
                // Use the credential for SSH authentication
                withCredentials([sshUserPrivateKey(credentialsId: '18.179.46.195', keyFileVariable: 'SSH_KEY')]) {
                    sh """
                        # Make sure to replace your-ec2-instance-ip with the actual IP
                        ssh -i \$SSH_KEY ubuntu@18.179.46.195 'bash -s' < https://github.com/QuratulAin20/Hello-world-project.git/Bashscript.sh
                    """
                }
            }
        }
    }

