FROM centos:7
# Date:2023.11.15
RUN yum install -y strace enscript curl wget swig bzip2 ghostscript autoconf automake cmake Cython \
    glibc-devel zlib-devel python-devel libcurl libpng libcurl-devel bzip2-devel  \
    libtool-ltdl libtool-ltdl-devel libxml2-devel pigz ncurses-devel libffi-devel libxslt-devel sqlite-devel tbb-devel audit audit-libs audit-libs-devel \
    gcc-gfortran libicu-devel make openblas-devel pango pcre2-devel tcl tk unzip which zip \
    perl-CPAN perl-IPC-Cmd perl-WWW-Curl java-11-openjdk java-11-openjdk-devel gcc gcc-c++ glibc-headers

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && yum install -y python2-pip openssl-devel

#make directory
RUN mkdir -p /raw_data/ /database/ /project/ /outdir/ /software/
RUN cd /software/ && wget https://www.openssl.org/source/openssl-1.1.1m.tar.gz --no-check-certificate &&  \
    tar xzvf openssl-1.1.1m.tar.gz && cd  openssl-1.1.1m && ./config --prefix=/software/openssl/ && make -j20 && make install
RUN ln -s /software/openssl/bin/openssl /usr/bin/openssl
RUN ln -s /software/openssl/include/openssl /usr/include/openssl
RUN echo "/software/openssl/lib" >> /etc/ld.so.conf
RUN ldconfig -v
#Install python3
RUN cd /software/ && wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz &&  \
    tar xvf Python-3.11.0.tgz && cd Python-3.11.0  \
    && ./configure --with-openssl=/software/openssl/ --prefix=/software/Python-v3.11.0 && make -j20 && make install

#use_2to3 is invalid.
RUN /software/Python-v3.11.0/bin/pip3 install setuptools==57.5.0
RUN /software/Python-v3.11.0/bin/pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple tensorflow scikit-learn PyVCF RSeQC cutadapt tornado seaborn  \
    edlib CNVkit PyYAML wheel parse2csv openpyxl pandas numpy configparser biopython pysam matplotlib  \
    Cython parse CrossMap cryptography easycython HTSeq seaborn matplotlib pandas

#Install R(https://cran.r-project.org/index.html)
RUN cd /software/ && wget https://cloud.r-project.org/src/base/R-4/R-4.2.3.tar.gz &&  \
    tar xzvf R-4.2.3.tar.gz && cd R-4.2.3 && ./configure --enable-R-shlib --with-readline=no --with-x=no --enable-memory-profiling && make -j20 && make install &&  \
    echo "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org/'; options(repos = r);" > ~/.Rprofile

RUN Rscript -e "install.packages(c(\"BiocManager\",\"tidyverse\"))" && \
    Rscript -e "BiocManager::install(c(\"Rgraphviz\",\"SPIA\",\"hwriter\", \
    \"hwriter\",\"pathview\",\"WGCNA\",\"DESeq2\",\"vegan\",\"edgeR\",\"clusterProfiler\", \
    \"RCurl\",\"GSVA\",\"gage\",\"GenomicRanges\",\"GenomicAlignments\", \
    \"biocGraph\",\"safe\",\"topGO\",\"ComplexHeatmap\",\"KEGGgraph\",\"EDASeq\",\"ReportingTools\"))"

###bwa#######
RUN yum install -y git && cd /software && git clone https://github.com/lh3/bwa.git && cd bwa && make
###seqtk#######
RUN cd /software && git clone https://github.com/lh3/seqtk.git && cd seqtk && make
###fastp######
RUN cd /usr/bin/ && wget http://opengene.org/fastp/fastp && chmod a+x ./fastp
###picard######
RUN cd /software/ && wget https://github.com/broadinstitute/picard/releases/download/3.1.1/picard.jar
###samtools####
RUN cd /software/ && wget https://github.com/samtools/samtools/releases/download/1.18/samtools-1.18.tar.bz2 &&  \
    tar xjvf samtools-1.18.tar.bz2 && cd samtools-1.18 && ./configure --prefix=/software/samtools-v1.18 && make -j20 && make install
###bcftools####
RUN cd /software/ && wget https://github.com/samtools/bcftools/releases/download/1.18/bcftools-1.18.tar.bz2 &&  \
    tar xjvf bcftools-1.18.tar.bz2 && cd bcftools-1.18 && ./configure --prefix=/software/bcftools-v1.18 && make -j20 && make install
###htslib####
RUN cd /software/ && wget https://github.com/samtools/htslib/releases/download/1.18/htslib-1.18.tar.bz2 &&  \
    tar xjvf htslib-1.18.tar.bz2 && cd htslib-1.18 && ./configure --prefix=/software/htslib-v1.18 && make -j20 && make install

