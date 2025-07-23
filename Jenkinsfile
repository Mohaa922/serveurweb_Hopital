pipeline {
    agent {
        label 'vm2'
    }



    environment {
        DOCKER_IMAGE = "hopital-web:latest"
        CONTAINER_NAME = "hopital-web"
        APP_PORT = "8080"
    }

    stages {

        stage('🐳 Build image Docker') {
            steps {
                echo "📦 Construction de l'image Docker"
                sh '''
                    docker build -t ${DOCKER_IMAGE} .
                '''
            }
        }

        stage('🧹 Stop & Remove previous container') {
            steps {
                echo "🗑️ Arrêt et suppression de l'ancien conteneur (s'il existe)"
                sh '''
                    docker rm -f ${CONTAINER_NAME} || true
                '''
            }
        }

        stage('🚀 Run new container') {
            steps {
                echo "🚀 Lancement du nouveau conteneur"
                sh '''
                    docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:80 ${DOCKER_IMAGE}
                '''
            }
        }
    }

    post {
        always {
            echo '✅ Pipeline terminé.'
        }
    }
}

    
