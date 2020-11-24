pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'git pull origin master && docker build -t nginx-kirin:$(date +%Y-%m-%d-%H-%M) .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'dgoss run nginx-kirin:$(date +%Y-%m-%d-%H-%M) | tee ~/dgoss.log'
                sh 'bash test.sh'
            }
        }
        stage('Push') {
            steps {
                echo 'Deploying....'
                sh 'docker tag nginx-kirin:$(date +%Y-%m-%d-%H-%M)  caddyshake/nginx-kirin:$(date +%Y-%m-%d-%H-%M)'
                sh 'docker push caddyshake/nginx-kirin:$(date +%Y-%m-%d-%H-%M)'
            }
        }
    }
    post {
        success {
            echo 'I will always say Hello again!'

            emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
        }
        failure {
            echo 'Fail'
        }
    }
}
