pipeline {
    agent any


    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kshitij-y/Joke-Genie.git'
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
