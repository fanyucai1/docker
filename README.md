1. 停止所有容器

        docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker stop
2. 删除所有容器

        docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker rm
3. 删除所有none镜像
    
        docker images|grep none|awk '{print $3 }'|xargs docker rmi
4. 强制删除镜像
    
        docker rmi -f 8f5116cbc201
5. 停止正在运行的容器

        docker stop 3e42fb38f847

## No space left on device

    docker rm $(docker ps -q -f 'status=exited')
    docker rmi $(docker images -q -f "dangling=true")

## 镜像保存与加载

    docker save -o my_ubuntu_v3.tar runoob/ubuntu:v3
    docker load --input my_ubuntu_v3.tar

## 镜像上传dockerhub

    docker login -u fanyucai
    docker tag biobase fanyucai1/biobase
    docker push fanyucai1/biobase

## example docker file:

[Dockerfile](Dockerfile)  

## You can download my docker images: 

[biobase](https://hub.docker.com/repository/docker/fanyucai1/biobase)

[rna](https://hub.docker.com/repository/docker/fanyucai1/rna)

[bio_tumor](https://hub.docker.com/repository/docker/fanyucai1/bio_tumor)

## 2023.11 new docker base centos7 

[base](https://hub.docker.com/repository/docker/fanyucai1/base/general)

centos:7 java-11 R=4.2.3 Python=v3.11.0 

[Dockerfile](base/Dockerfile)  

you can download:

      docker pull fanyucai1/base

[SNV](https://hub.docker.com/repository/docker/fanyucai1/base/general)

you can dowonload:

      docker pull fanyucai1/snv