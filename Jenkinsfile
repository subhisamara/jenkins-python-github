pipeline {
    agent { docker { image 'python:3.5.1' } }
    stages {
        stage('Build') {
            steps {
                sh 'echo "Building..."'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Testing..."'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "Deploying..."'
            }
        }
        stage('Python Job') {
            steps {
                sh 'python main.py'
            }
        }
    }
}
