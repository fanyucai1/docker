FROM centos:7

RUN yum install -y strace enscript curl wget swig bzip2 ghostscript autoconf automake cmake Cython \
    glibc-devel zlib-devel python-devel libcurl libpng libcurl-devel bzip2-devel  \
    libtool-ltdl libtool-ltdl-devel libxml2-devel pigz ncurses-devel libffi-devel libxslt-devel sqlite-devel tbb-devel audit audit-libs audit-libs-devel \
    gcc-gfortran libicu-devel make openblas-devel pango pcre2-devel tcl tk unzip which zip \
    perl-CPAN perl-IPC-Cmd perl-WWW-Curl java-11-openjdk java-11-openjdk-devel gcc gcc-c++ glibc-headers libstdc++-static git patch file

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && yum install -y python2-pip openssl-devel htslib

#make directory
RUN mkdir -p /raw_data/ /database/ /project/ /outdir/ /software/
RUN cd /software/ && wget https://www.openssl.org/source/openssl-1.1.1m.tar.gz --no-check-certificate &&  \
    tar xzvf openssl-1.1.1m.tar.gz && cd  openssl-1.1.1m && ./config --prefix=/software/openssl/ && make -j20 && make install &&  \
    ln -s /software/openssl/bin/openssl /usr/bin/openssl &&  \
    ln -s /software/openssl/include/openssl /usr/include/openssl &&  \
    echo "/software/openssl/lib" >> /etc/ld.so.conf && ldconfig -v
#Install python3
RUN cd /software/ && wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz &&  \
    tar xvf Python-3.11.0.tgz && cd Python-3.11.0  \
    && ./configure --with-openssl=/software/openssl/ --prefix=/software/Python-v3.11.0 && make -j20 && make install
#use_2to3 is invalid.
RUN /software/Python-v3.11.0/bin/pip3 install setuptools==57.5.0

#Install R(https://cran.r-project.org/index.html)
RUN cd /software/ && wget https://cloud.r-project.org/src/base/R-4/R-4.2.3.tar.gz &&  \
    tar xzvf R-4.2.3.tar.gz && cd R-4.2.3 && ./configure --enable-R-shlib --with-readline=no --with-x=no --enable-memory-profiling && make -j20 && make install &&  \
    echo "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org/'; options(repos = r);" > ~/.Rprofile && Rscript -e "install.packages(c(\"BiocManager\"))"
###java####
RUN cd /software/ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk-jre/17.0.9+9/openlogic-openjdk-jre-17.0.9+9-linux-x64.tar.gz && tar xzvf openlogic-openjdk-jre-17.0.9+9-linux-x64.tar.gz && \
    wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk-jre/8u392-b08/openlogic-openjdk-jre-8u392-b08-linux-x64.tar.gz && tar xzvf openlogic-openjdk-jre-8u392-b08-linux-x64.tar.gz

###Miniconda3####
RUN cd /software/ && wget --no-check-certificate https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-py37_23.1.0-1-Linux-x86_64.sh &&  \
    bash Miniconda3-py37_23.1.0-1-Linux-x86_64.sh -bfp /software/Miniconda3 && rm Miniconda3-py37_23.1.0-1-Linux-x86_64.sh

###delete software
RUN cd /software/ && rm -rf *.gz *.tgz *.bz2 *.zip Python-3.11.0 R-4.2.3 openssl-1.1.1m