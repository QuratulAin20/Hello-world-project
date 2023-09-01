 agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

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
        stage('login to dockerhub') {
            steps {
                //login to dockerhub
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
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
                withCredentials([sshUserPrivateKey(credentialsId: '54.238.181.230', keyFileVariable: 'SSH_KEY')]) {
                    sh """
                        ssh -i \$SSH_KEY ubuntu@54.238.181.230 'bash -s' < https://github.com/QuratulAin20/Hello-world-project.git/Bashscript.sh
                    """
                }
            }
        }
    }
}
