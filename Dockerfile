FROM alpine AS base
# glibc+conda+megahit+cd-hit+Trimmomatic+samtools+bcftools+seqtk+fastqtk+bwa+fastp+nextclade
RUN apk update && \
    apk add --no-cache build-base bash curl libxau make unzip musl-dev perl perl-dev g++ openblas-dev libgomp python3 python3-dev \
    libc-dev zlib-dev bzip2 bzip2-dev xz-dev tar git gfortran libxml2-dev libxslt-dev R R-dev py3-pip py3-seaborn py3-matplotlib py3-numpy py3-pandas &&  \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-2.35-r1.apk && \
    apk add --no-cache --force-overwrite glibc-2.35-r1.apk && \
    rm glibc-2.35-r1.apk && mkdir -p /lib64/ /opt/conda/ /software/ /raw_data /script /outdir /ref/ && ln -s /usr/glibc-compat/lib/* /lib64/ &&  \
    cd /opt/ && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh &&  \
    bash /opt/Miniconda3-latest-Linux-x86_64.sh -f -b -p /opt/conda/ &&  \
    cd /software/ && wget https://github.com/voutcn/megahit/releases/download/v1.2.9/MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz &&  \
    tar xzvf MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz &&  \
    cd /software/ && wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip && unzip Trimmomatic-0.39.zip && \
    wget https://github.com/weizhongli/cdhit/releases/download/V4.8.1/cd-hit-v4.8.1-2019-0228.tar.gz &&  \
    tar xzvf cd-hit-v4.8.1-2019-0228.tar.gz && cd cd-hit-v4.8.1-2019-0228 && make &&  \
    rm -rf *zip *gz /opt/Miniconda3-latest-Linux-x86_64.sh /var/cache/apk/* &&  \
    cd /usr/bin/ && wget -O nextclade https://github.com/nextstrain/nextclade/releases/latest/download/nextclade-x86_64-unknown-linux-gnu && chmod u+x ./nextclade &&  \
    wget http://opengene.org/fastp/fastp && chmod a+x ./fastp &&  \
    cd /software/ && git clone https://github.com/lh3/seqtk.git && cd seqtk && make -j20 &&  \
    cd /software/ && git clone https://github.com/lh3/bwa.git && cd bwa && make -j20 &&  \
    cd /software/ && git clone https://github.com/ndaniel/fastqtk.git && cd fastqtk && make -j20 && \
    cd /software/&& wget https://github.com/samtools/samtools/releases/download/1.20/samtools-1.20.tar.bz2 && tar xjvf samtools-1.20.tar.bz2 && \
    wget https://github.com/samtools/bcftools/releases/download/1.20/bcftools-1.20.tar.bz2 && tar xjvf bcftools-1.20.tar.bz2 && \
    cd samtools-1.20 && ./configure --prefix=/software/samtools && make -j20 && make install && \
    cd /software/bcftools-1.20 && ./configure --prefix=/software/bcftools && make -j20 && make install &&  \
    cd /software/ && wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk-jre/17.0.9+9/openlogic-openjdk-jre-17.0.9+9-linux-x64.tar.gz && tar xzvf openlogic-openjdk-jre-17.0.9+9-linux-x64.tar.gz && \
    wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk-jre/8u392-b08/openlogic-openjdk-jre-8u392-b08-linux-x64.tar.gz && tar xzvf openlogic-openjdk-jre-8u392-b08-linux-x64.tar.gz &&  \
    wget http://ccb.jhu.edu/software/FLASH/FLASH-1.2.11-Linux-x86_64.tar.gz && tar xzvf FLASH-1.2.11-Linux-x86_64.tar.gz && rm -rf /software/bcftools-1.20 /software/samtools-1.20 *zip *gz *bz2

FROM base AS base1
RUN /opt/conda/bin/conda install -c bioconda -c conda-forge -c defaults  \
    bowtie2 pangolin quast kraken2 krakentools bedtools ivar=1.3 minimap2 && \
    /opt/conda/bin/conda clean -a -y