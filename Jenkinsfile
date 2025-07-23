pipeline {
    agent {
        label 'vm2'
    }

    stages {
        stage('📥 Clonage du projet') {
            steps {
                git 'https://github.com/Mohaa922/serveurweb_Hopital.git'
            }
        }

        stage('🐳 Build image Docker') {
            steps {
                dir('.') {
                    sh 'docker build -t hopital-web:latest .'
                }
            }
        }

        stage('🚀 Déploiement conteneur') {
            steps {
                sh 'docker rm -f hopital-container || true'
                sh 'docker run -d --name hopital-container -p 80:80 hopital-web:latest'
            }
        }
    }

    post {
        always {
            echo '✅ Pipeline terminé'
        }
    }
}

