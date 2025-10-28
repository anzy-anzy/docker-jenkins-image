pipeline {
    agent any

    environment {
        // Change this to your actual Docker Hub repo
        DOCKER_HUB_REPO = 'anslem2025/apache-webserver'
        // This must match the credentials ID you created in Jenkins
        DOCKER_HUB_CREDENTIALS = 'dockerhub-login'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Cloning the GitHub repository...'
                git branch: 'main', url: 'https://github.com/anzy-anzy/docker-jenkins-image.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    dockerImage = docker.build("${DOCKER_HUB_REPO}:latest")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    echo 'Pushing image to Docker Hub...'
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_HUB_CREDENTIALS}") {
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage('Clean Up') {
            steps {
                echo 'Cleaning up local Docker images...'
                sh 'docker system prune -af'
            }
        }
    }

    post {
        success {
            echo '✅ Build and push successful!'
        }
        failure {
            echo '❌ Build failed! Check the console output for details.'
        }
    }
}

