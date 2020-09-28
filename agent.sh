echo "======开始进行数据库构建======="
echo "by pony@lixiang.com"
echo "======agent环境检测=========="
codeql database create dbfile --language=java
zip -r dbfile.zip ./dbfile/*
curl --form "file=@/Users/pony/.jenkins/workspace/test01_master/dbfile.zip" http://127.0.0.1:8088/fileupload/
#curl --form "file=@/Users/pony/.jenkins/workspace/test01_master/target/mypiplinetest-1.0-SNAPSHOT.jar" http://127.0.0.1:8088/fileupload/'