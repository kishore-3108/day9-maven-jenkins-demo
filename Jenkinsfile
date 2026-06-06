pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        IMAGE_NAME = "kishore3129/day9-app"
        IMAGE_TAG = "v1.0.${BUILD_NUMBER}"
    }
    stages {
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
    }
    post {
        always {
            bat 'docker logout'
        }
    }
}
