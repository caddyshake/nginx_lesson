pipeline {
    agent any

    stages {
        stage ('Setup variabels'){
            steps {
                script {
                    env.DATE = "date +%Y-%m-%d--%H_%M_%S"
                    env.TEST = "dgoss run nginx-kirin:${DATE} > ~/dgoss.log 2>&1"
                    env.PULL = "git pull origin master && docker build -t nginx-kirin:${DATE} ."
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
                sh '${PULL}'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh '${TEST}'
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
