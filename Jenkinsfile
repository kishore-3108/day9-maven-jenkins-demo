pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        DOCKER_IMAGE = "kishore3129/day9-app"
        DOCKER_TAG = "v1.0.${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kishore7669/day9-maven-jenkins-demo.git'
            }
        }
        
        stage('Maven Build') {
            steps {
                bat 'mvn clean package'
            }
        }
        
        stage('Docker Build') {
            steps {
                bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                bat "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
            }
        }
        
        stage('Docker Login') {
            steps {
                bat 'echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin'
            }
        }
        
        stage('Docker Push') {
            steps {
                bat "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                bat "docker push ${DOCKER_IMAGE}:latest"
            }
        }
        
        stage('Cleanup') {
            steps {
                bat "docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG}"
                bat "docker rmi ${DOCKER_IMAGE}:latest"
            }
        }
    }
    
    post {
        always {
            bat 'docker logout'
        }
    }
}