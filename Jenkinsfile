pipeline {
    agent any
    
    environment {
        // Configuration du registre Docker
        DOCKER_REGISTRY = 'docker.io'  // Peut être remplacé par votre registre privé
        DOCKER_REGISTRY_CREDENTIALS = 'docker-credentials'  // ID des credentials dans Jenkins
        IMAGE_NAME = 'app-simple'
        IMAGE_TAG = "${BUILD_NUMBER}"
        FULL_IMAGE_NAME = "${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Récupération du code source...'
                checkout scm
            }
        }
        
        stage('Environment Info') {
            steps {
                echo '📋 Informations sur l\'environnement de build'
                sh '''
                    echo "Node version: $(node --version || echo 'Node non installé')"
                    echo "NPM version: $(npm --version || echo 'NPM non installé')"
                    echo "Docker version: $(docker --version || echo 'Docker non installé')"
                    echo "Build Number: ${BUILD_NUMBER}"
                    echo "Workspace: ${WORKSPACE}"
                '''
            }
        }
        
        stage('Install Dependencies') {
            steps {
                echo '📦 Installation des dépendances...'
                sh 'npm install'
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Exécution des tests...'
                sh 'npm test'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo '🐳 Construction de l\'image Docker...'
                script {
                    // Construction de l'image Docker
                    dockerImage = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                    
                    // Tag supplémentaire avec 'latest'
                    sh "docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:latest"
                }
            }
        }
        
        stage('Test Docker Image') {
            steps {
                echo '🔍 Test de l\'image Docker...'
                script {
                    // Démarrer le conteneur en mode test
                    sh """
                        docker run -d --name test-container-${BUILD_NUMBER} -p 3001:3000 ${IMAGE_NAME}:${IMAGE_TAG}
                        sleep 5
                        docker logs test-container-${BUILD_NUMBER}
                        docker stop test-container-${BUILD_NUMBER}
                        docker rm test-container-${BUILD_NUMBER}
                    """
                }
                echo '✅ Image Docker testée avec succès'
            }
        }
        
        stage('Push to Docker Registry') {
            steps {
                echo '📤 Push de l\'image vers le registre Docker...'
                script {
                    // Authentification et push vers le registre Docker
                    docker.withRegistry("https://${DOCKER_REGISTRY}", "${DOCKER_REGISTRY_CREDENTIALS}") {
                        // Push de l'image avec le tag du build
                        dockerImage.push("${IMAGE_TAG}")
                        
                        // Push de l'image avec le tag 'latest'
                        dockerImage.push("latest")
                    }
                }
                echo '✅ Image poussée avec succès vers le registre'
            }
        }
        
        stage('Clean Up') {
            steps {
                echo '🧹 Nettoyage des images locales...'
                sh """
                    docker rmi ${IMAGE_NAME}:${IMAGE_TAG} || true
                    docker rmi ${IMAGE_NAME}:latest || true
                """
            }
        }
    }
    
    post {
        success {
            echo '✅ Pipeline exécuté avec succès!'
            echo "📦 Image disponible: ${FULL_IMAGE_NAME}"
        }
        failure {
            echo '❌ Le pipeline a échoué!'
        }
        always {
            echo '🔄 Nettoyage du workspace...'
            cleanWs()
        }
    }
}
