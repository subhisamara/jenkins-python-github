pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: "${env.CHANGE_BRANCH}"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: "${env.GIT_URL}"]]])
            }
        }
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
        stage('Python Job') {
            steps {
                sh 'echo "Running Python job..."'
                sh 'python main.py'
            }
        }
    }

    triggers {
        ghprb {
            adminlist('your-github-username')
            triggerPhrase('build now')
        }
    }
}
