pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'your-dockerhub-username'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Images') {
            steps {
                sh 'docker build -t ${DOCKER_REGISTRY}/nodejs-service:latest ./nodejs-service'
                sh 'docker build -t ${DOCKER_REGISTRY}/python-service:latest ./python-service'
            }
        }

        stage('Scan Images with Docker Scout') {
            steps {
                sh 'docker scout cves ${DOCKER_REGISTRY}/nodejs-service:latest'
                sh 'docker scout cves ${DOCKER_REGISTRY}/python-service:latest'
            }
        }

        stage('Push Images') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push ${DOCKER_REGISTRY}/nodejs-service:latest'
                    sh 'docker push ${DOCKER_REGISTRY}/python-service:latest'
                }
            }
        }

        stage('Deploy to AWS/Azure') {
            steps {
                sh './deploy.sh aws'
            }
        }
    }
}
