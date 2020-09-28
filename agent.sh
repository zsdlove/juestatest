
#配置编译语言
language=java

#配置服务端文件上传api
api=http://127.0.0.1:8088/fileupload/

#配置输出到jar包名称,如果采用直接分析jar包到方案到话，可配置。使用codeql方案无需配置。
outjar="mypiplinetest-1.0-SNAPSHOT.jar"

databasename='dbfile.zip'

echo "by pony@lixiang.com"
echo "======agent环境配置=========="
echo "拉取远程agent"
wget "http://127.0.0.1:9090/agent/codeqlpath.zip"
if [ $? -eq 0 ]; then
     echo "[*]download the agent successfully,and now begen to extracted the agent."
else
     echo "[*]download agent failed,please check if you have the permission to get the agent file."
     exit 0
fi
unzip ./codeqlpath.zip
if [ $? -eq 0 ]; then
     echo "extracted the agent successfully,and then config the env."
else
     echo "can't extracted the agent,perhaps you got a broken file."
     exit 0
fi

#agent环境配置
current_path=`pwd`
codeqlpath=$current_path/'codeqlpath'
echo $codeqlpath
if echo $PATH | grep "codeql"
then
    echo "环境正常,无需配置"
else
    echo "未配置环境变量,下面配置环境"
    export PATH=$PATH:$codeqlpath
    if echo $PATH ｜grep "codeql"
    then 
        echo "环境配置成功"
    fi
fi

#构建数据库
codeql database create dbfile --language=$language
zip -r dbfile.zip ./dbfile/*
#post发送文件到远程服务端
dbfilepath=$current_path/$databasename
curl --form "file=@$dbfilepath" $api
#curl --form "file=@$dbfile/target/$outjar" $api
echo "clean the tmp file"
rm -rf dbfile
rm dbfile.zip
rm codeqlpath.zip
rm -rf codeqlpath
if [ $? -eq 0 ]; then
     echo "succeed clean the tmp file."
     exit 0
else
     echo "perhaps,you have no permission to remove these files."
     exit 0
fi