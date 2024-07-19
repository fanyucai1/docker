# [My Docker Hub homepage](https://hub.docker.com/repositories/fanyucai1)

Unlike the 1.0 version of the bioinformatics software images, which were mostly CentOS 7, the current developer versions are based on the original Alpine image. 
Using Alpine can effectively reduce the file size of Docker images. 
Based on Alpine, we have built a base image that includes Alpine, glibc, and Bioconda. 
On this foundation, we have constructed the metagenomic analysis image "meta" and the "covid" image, which can be used for COVIDSeq analysis.

Additionally, the original images on Docker Hub are still available. Currently, we only provide Dockerfile files for the latest developer images.

**The commonly used Docker analysis commands are as follows**
```{.cs}
# 停止所有容器
docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker stop

# 删除所有容器
docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker rm

# 删除所有none镜像
docker images|grep none|awk '{print $3 }'|xargs docker rmi

# 强制删除镜像
docker rmi -f 8f5116cbc201

# 停止正在运行的容器
docker stop 3e42fb38f847

# No space left on device**
docker rm $(docker ps -q -f 'status=exited')
docker rmi $(docker images -q -f "dangling=true")

# 镜像保存与加载
docker save -o my_ubuntu_v3.tar runoob/ubuntu:v3
docker load --input my_ubuntu_v3.tar

# 镜像上传docker hub
docker login -u fanyucai
docker tag biobase fanyucai1/biobase
docker push fanyucai1/biobase
```



