#   基础镜像
https://hub.docker.com/r/fanyucai1/base 

#   生信肿瘤变异检测的软件环境
https://hub.docker.com/r/fanyucai1/bio_tumor

#   erro解决

**当docker遇到image has dependent child images**

####    停止所有容器

docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker stop

####    删除所有容器
    
docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker rm

####    删除所有none镜像
    
docker images|grep none|awk '{print $3 }'|xargs docker rmi

####    强制删除镜像
    
docker rmi -f 8f5116cbc201

####    停止正在运行的容器

    docker stop 3e42fb38f847

**当遇到如下错误‘No space left on device’可以尝试运行**

    docker rm $(docker ps -q -f 'status=exited')
    docker rmi $(docker images -q -f "dangling=true")
