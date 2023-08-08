
pipeline
{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('vss-docker-key')
	}

	stages 
    {

         stage('Cleanup') {
            steps {
                script {
                    def runningContainers = sh(script: 'docker ps -q', returnStdout: true).trim()
                    if (runningContainers) {
                        sh "docker stop ${runningContainers}"
                        sh "docker rm ${runningContainers}"
                    }

                    def imagesToDelete = sh(script: 'docker images -q', returnStdout: true).trim()
                    if (imagesToDelete) {
                        sh "docker rmi -f ${imagesToDelete}"
                    }
                    sh 'rm -rf /tmp/*'
                    sh 'docker system prune -a'
                }
            }
        }
        
         stage('Build Mysql') {
            steps {
                dir('db-c') {
                    sh 'docker build -t umang3x5/smart-clothing-system-scs-mysql-db:latest .'
                    sh 'docker tag umang3x5/smart-clothing-system-scs-mysql-db:latest umang3x5/smart-clothing-system-scs-mysql-db:1.0'
                }
            }
        }

        stage('Build Backend') {
            steps {
                dir('backend') {
                    sh 'docker build -t umang3x5/smart-clothing-system-frontend:latest .'
                    sh 'docker tag umang3x5/smart-clothing-system-backend:latest umang3x5/smart-clothing-system-backend:1.0'
                }
            }
        }

        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    sh 'docker build -t umang3x5/smart-clothing-system-frontend:latest .'
                    sh 'docker tag umang3x5/smart-clothing-system-frontend:latest umang3x5/smart-clothing-system-frontend:1.0'
                }
            }
        }
        

        stage('push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'vss-docker-key', passwordVariable: 'DOCKERHUB_CREDENTIALS_PSW', usernameVariable: 'DOCKERHUB_CREDENTIALS_USR')]) {
                    sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
                    sh 'docker push umang3x5/smart-clothing-system-fronted:1.0'
                    sh 'docker push umang3x5/smart-clothing-system-backend:1.0'
                    sh 'docker push umang3x5/smart-clothing-system-scs-mysql-db:1.0'
                }
            }
        }

        stage('Deploy') {
                steps {
                    sh 'docker-compose -f docker-compose.yaml down'
                    sh 'docker-compose -f docker-compose.yaml up -d'
                    sh 'docker-compose ps'
                }
            }
    }

        post {
            always {
                sh 'docker logout'
            }
        }
}