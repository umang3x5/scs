pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('vss-docker-key')
    }

    stages {
        stage('Cleanup') {
            steps {
                bat 'FOR /F %%i IN (\'docker ps -q\') DO docker stop %%i'
                bat 'FOR /F %%i IN (\'docker ps -q\') DO docker rm %%i'
                bat 'FOR /F %%i IN (\'docker images -q\') DO docker rmi %%i'
                bat 'docker system prune -af'
            }
        }

        stage('Build Mysql') {
            steps {
                dir('db-c') {
                    bat 'docker build -t umang3x5/smart-clothing-system-scs-mysql-db:latest .'
                    bat 'docker tag umang3x5/smart-clothing-system-scs-mysql-db:latest umang3x5/smart-clothing-system-scs-mysql-db:1.0'
                }
            }
        }

        stage('Build Backend') {
            steps {
                dir('backend') {
                    bat 'docker build -t umang3x5/smart-clothing-system-backend:latest .'
                    bat 'docker tag umang3x5/smart-clothing-system-backend:latest umang3x5/smart-clothing-system-backend:1.0'
                }
            }
        }

        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    bat 'docker build -t umang3x5/smart-clothing-system-frontend:latest .'
                    bat 'docker tag umang3x5/smart-clothing-system-frontend:latest umang3x5/smart-clothing-system-frontend:1.0'
                }
            }
        }

        stage('push') {
            steps {
                withCredentials([string(credentialsId: 'vss-docker-key', variable: 'DOCKERHUB_CREDENTIALS_PSW')]) {
                    bat 'docker login -u umang3x5 -p %DOCKERHUB_CREDENTIALS_PSW%'
                    bat 'docker push umang3x5/smart-clothing-system-fronted:1.0'
                    bat 'docker push umang3x5/smart-clothing-system-backend:1.0'
                    bat 'docker push umang3x5/smart-clothing-system-scs-mysql-db:1.0'
                }
            }
        }

        stage('Deploy') {
            steps {
                bat 'docker-compose -f docker-compose.yaml down'
                bat 'docker-compose -f docker-compose.yaml up -d'
                bat 'docker-compose ps'
            }
        }
    }

    post {
        always {
            bat 'docker logout'
        }
    }
}
