# [My Docker Hub homepage](https://hub.docker.com/repositories/fanyucai1)

   We strongly recommend that you use **fanyucai1/base** to build your own Docker image.
   
   The latest update was on **February 21st, 2024**.
   
   We also have provided some examples for building Docker images in **demo folder**, for reference only.

**Download**
```{.cs}
docker pull fanyucai1/base
```
**Software Details:**
```{.cs}
#linux lib

  strace enscript curl wget swig bzip2 ghostscript autoconf automake cmake Cython
      glibc-devel zlib-devel python-devel libcurl libpng libcurl-devel bzip2-devel
      libtool-ltdl libtool-ltdl-devel libxml2-devel pigz ncurses-devel libffi-devel libxslt-devel sqlite-devel tbb-devel audit audit-libs audit-libs-devel
      gcc-gfortran libicu-devel make openblas-devel pango pcre2-devel tcl tk unzip which zip
      perl-CPAN perl-IPC-Cmd perl-WWW-Curl java-11-openjdk java-11-openjdk-devel gcc gcc-c++ glibc-headers
      python2-pip openssl-devel htslib

# python-3.11.0

/software/Python-v3.11.0/bin/python3

# R-4.2.3

/usr/local/bin/R

# openlogic-openjdk-jre-17.0.9+9-linux-x64

/software/openlogic-openjdk-jre-17.0.9+9-linux-x64/bin/java

# openlogic-openjdk-jre-8u392-b08-linux-x64

/software/openlogic-openjdk-jre-8u392-b08-linux-x64/bin/java

# Miniconda3 conda 24.1.2

/software/Miniconda3/bin/conda
```
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

# 清除缓存
docker system prune -a --force

# 镜像上传docker hub
docker login -u fanyucai
docker tag biobase fanyucai1/biobase
docker push fanyucai1/biobase
```

123

