pipeline {
    agent any

    tools {
        nodejs 'Node'
        docker 'docker'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kshitij-y/Joke-Genie.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                nodejs(nodeJSInstallationName: 'Node') {
                    sh 'npm install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t joke-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 3000:3000  joke-app'
            }
        }
    }

    post {
        always {
            echo "Pipeline completed"
        }
    }
}
