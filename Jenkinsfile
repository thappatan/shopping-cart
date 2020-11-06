pipeline{
    agent any

    stages{
        stage('uni test & report'){
            steps{
                sh label: 'go test', script: '''
                cd store-service
                go mod download
                go test -v ./cmd/tests 2>&1 | go-junit-report > report.xml '''
            }
            post {
                always {
                    junit 'store-service/report.xml'
                }
            }
        }
        stage('build & start application'){
            steps{
                sh label: 'docker-compose', script: 'docker-compose up -d --build --force-recreate'
            }
        }
        stage('run api test robot'){
            steps{
                sh label: 'docker-compose', script: '''cd test/api
                python3 -m venv env
                source env/bin/activate
                pip install -r requirements.txt
                robot product.robot
                deactivate'''
            }
            post {
                always {
                    robot outputPath: 'test/api', passThreshold: 100.0
                    sh label: 'docker-compose', script: 'docker-compose down'
                }
            }
        }
    }
}