pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'git pull origin master'
                sh 'docker build -t nginx-kirin:$(date +%Y-%m-%d--%H_%M_%S) .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                dgoss run nginx-kirin:v1 > ~/dgoss.log 2>&1
                sh 'bash ~/script.sh'
            }
        }
        stage('Push') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
