pipeline {
    agent any

    stages {
        stage('Build') {
            environment {
                STAGE = "Build"
            }
            steps {
                echo "Stage = ${env.STAGE}"
                echo 'Building..'
                sh 'git pull origin master && docker build -t nginx-kirin:$(date +%Y-%m-%d-%H-%M) .'
            }
        }
        stage('Test') {
            environment {
                STAGE = "Test"
            }
            steps {
                echo "Stage = ${env.STAGE}"
                echo 'Testing..'
                sh 'dgoss run nginx-kirin:$(date +%Y-%m-%d-%H-%M) | tee ~/dgoss.log'
                sh 'bash test.sh'
            }
        }
        stage('Push') {
            environment {
                STAGE = "Push"
            }
            steps {
                echo "Stage = ${env.STAGE}"
                echo 'Deploying....'
                sh 'docker tag nginx-kirin:$(date +%Y-%m-%d-%H-%M)  caddyshake/nginx-kirin:$(date +%Y-%m-%d-%H-%M)'
                sh 'docker push caddyshake/nginx-kirin:$(date +%Y-%m-%d-%H-%M)'
            }
        }
    }
    post {
        success {
            echo '${env.STAGE}'
            sh 'echo "Build finished at stage  " | mail -s "Build done." "root@jenkins"'
        }
        failure {
            sh 'echo "Build failed at stage ${env.STAGE} " | mail -s "Failure" "root@jenkins"'
        }
    }
}
