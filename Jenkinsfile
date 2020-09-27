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
                //sh ./codeqlagent.sh 'sourcepath' 'dbpath'
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
            sh 'curl http://127.0.0.1:8089'//可以通过curl命令来上传文件到服务端进行检测
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
