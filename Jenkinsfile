pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'dgoss run nginx-kirin:$(date +%Y-%m-%d-%H-%M) > ~/dgoss.log 2>&1'
                sh 'git pull origin master && docker build -t nginx-kirin:$(date +%Y-%m-%d--%H_%M_%S) .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh '${TEST}'
                sh 'bash ~/test.sh'
            }
        }
        stage('Push') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
