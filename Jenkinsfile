pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Buildig..'
                sh 'git pull origin master'
                sh 'docker build -t nginx-kirin:v1 .'
                sh 'echo $?'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Push') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
