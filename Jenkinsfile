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
            mail to: 'root@jenkins',
                subject: "Pipeline done: ${currentBuild.fullDisplayName}",
                body: "Pipeline was finished with ${env.BUILD_URL}"
        }
        failure {
            mail to: 'root@jenkins',
                subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                body: "Something is wrong with ${env.BUILD_URL}"
        }
    }
}
