pipeline {
    agent any

    tools {
        nodejs 'Node'
        dockerTool 'Docker'
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
        stage('Initialize'){
             def dockerHome = tool name: 'Docker', type: 'DockerTool'
            env.PATH = "${dockerHome}/bin:${env.PATH}"
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
