pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'git pull origin master && docker build -t nginx-kirin:$(date +%Y-%m-%d-%H-%M) .'
                sh 'dgoss run nginx-kirin:$(date +%Y-%m-%d-%H-%M) > ~/dgoss.log 2>&1'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'bash test.sh'
            }
        }
        stage('Push') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
