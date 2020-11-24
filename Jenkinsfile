pipeline {
    agent any

    stages {
        stage ('Setup variabels'){
            steps {
                script {
                    env.DATE = "sh 'date +%Y-%m-%d--%H_%M_%S'"
                    env.TEST = "dgoss run nginx-kirin:${DATE} > ~/dgoss.log 2>&1"
                    env.PULL = "git pull origin master && docker build -t nginx-kirin:${DATE} ."
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
                script {
                    def now = new Date()
                    println now.format("yyMMdd.HHmm", TimeZone.getTimeZone('UTC'))
                }
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
