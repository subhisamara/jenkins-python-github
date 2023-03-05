pipeline {
    agent {
            label 'python'
        }
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
