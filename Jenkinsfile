pipeline {
    agent any
    environment {//设置环境变量
        DISABLE_AUTH = 'true'
        DB_ENGINE    = 'sqlite'
    }
    stages {
        stage('build') {//构建
            steps {
                sh 'echo "ponygg"'
                sh '''
                   echo "nicejob"
                   ls -lah
                '''
                //sh 'printenv'//打印环境变量
                sh 'mvn package -DskipTests'
            }
        }
        stage('Test') {//测试
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy') {//部署
            steps {
                echo 'Deploying'
            }
        }
    }
    post {
        always {
            echo 'This will always run'
            
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}
