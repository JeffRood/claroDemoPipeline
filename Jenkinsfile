pipeline {
    agent any
    
    environment {
        DOCKERHUB_USERNAME = 'jeffrood'  // Cambia esto por tu usuario de Docker Hub
        DOCKERHUB_PASSWORD = credentials('726afe80-a0df-4f47-b216-9043fab43e01')  // El ID de tus credenciales de Docker Hub en Jenkins
        // AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')  // Cambia por tus credenciales de AWS
        // AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')  // Cambia por tus credenciales de AWS
    }
    
    stages {
        
        stage('Checkout Code') {
            steps {
                script {
                    // Clonamos el repositorio de GitLab
                    checkout scm
                }
            }
        }

        stage('Build Docker Images with Docker Compose') {
            steps {
                script {
                    // Construimos las imágenes usando Docker Compose
                    sh 'docker-compose -f docker-compose.yml build'
                }
            }
        }

        stage('Scan Images with Docker Scout') {
            steps {
                script {
                    // Escaneamos las imágenes construidas con Docker Scout para detectar vulnerabilidades
                    sh 'docker scout cves --all'
                }
            }
        }

        stage('Push Images to Docker Hub') {
            steps {
                script {
                    // Iniciamos sesión en Docker Hub
                    sh """
                    echo \$DOCKERHUB_PASSWORD | docker login -u \$DOCKERHUB_USERNAME --password-stdin
                    """
                    
                    // Etiquetamos y subimos las imágenes a Docker Hub
                    sh 'docker-compose -f docker-compose.yml push'
                }
            }
        }

        // stage('Deploy to AWS/Azure') {
        //     steps {
        //         script {
        //             // Aquí puedes añadir comandos para desplegar en AWS, Azure o cualquier plataforma que uses
        //             // Ejemplo: Usando AWS CLI para actualizar servicios o desplegar en un cluster.
        //             sh 'aws ecs update-service --cluster your-cluster-name --service your-service-name --force-new-deployment'
        //         }
        //     }
        // }
        
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
