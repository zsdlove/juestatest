echo "======开始进行数据库构建======="
echo "by pony@lixiang.com"
echo "======agent环境检测=========="
sh 'codeql database create dbfile --language=java'
sh 'zip -r dbfile.zip ./dbfile/*'
sh 'curl --form "file=@/Users/pony/.jenkins/workspace/test01_master/dbfile.zip" http://127.0.0.1:8088/fileupload/'//上传服务端
sh 'curl --form "file=@/Users/pony/.jenkins/workspace/test01_master/target/mypiplinetest-1.0-SNAPSHOT.jar" http://127.0.0.1:8088/fileupload/'//上传服务端
//或者直接ssh拷贝