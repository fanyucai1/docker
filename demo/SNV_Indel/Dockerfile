FROM fanyucai1/base
###bwa+seqtk+fastp+picard+varscan+MSIsensor-pro+abra2+fgbio+delly+sambamba+genefuse######
RUN cd /software && wget https://github.com/lh3/bwa/releases/download/v0.7.17/bwa-0.7.17.tar.bz2 && tar xjvf bwa-0.7.17.tar.bz2  && cd bwa-0.7.17 && make &&  \
    cd /software && wget https://github.com/lh3/seqtk/archive/refs/tags/v1.4.tar.gz && tar xzvf v1.4.tar.gz && cd seqtk-1.4 && make &&  \
    cd /usr/bin/ && wget http://opengene.org/fastp/fastp && chmod a+x ./fastp &&  \
    wget https://github.com/broadinstitute/picard/releases/download/3.1.1/picard.jar && chmod a+x picard.jar &&  \
    wget https://github.com/dkoboldt/varscan/releases/download/v2.4.6/VarScan.v2.4.6.jar && chmod a+x VarScan.v2.4.6.jar &&  \
    wget https://github.com/xjtu-omics/msisensor-pro/raw/master/binary/msisensor-pro && chmod a+x msisensor-pro && \
    wget https://github.com/mozack/abra2/releases/download/v2.24/abra2-2.24.jar && chmod a+x abra2-2.24.jar && \
    wget https://github.com/fulcrumgenomics/fgbio/releases/download/2.1.0/fgbio-2.1.0.jar && chmod a+x fgbio-2.1.0.jar &&  \
    wget https://github.com/dellytools/delly/releases/download/v1.1.8/delly_v1.1.8_linux_x86_64bit && chmod a+x delly_v1.1.8_linux_x86_64bit &&  \
    wget http://opengene.org/GeneFuse/genefuse && chmod a+x ./genefuse &&  \
    wget https://github.com/biod/sambamba/releases/download/v1.0.1/sambamba-1.0.1-linux-amd64-static.gz &&  \
    gunzip sambamba-1.0.1-linux-amd64-static.gz && chmod a+x ./sambamba-1.0.1-linux-amd64-static

###samtools+bcftools+htslib+bedops+VarDict+bedtools+Manta+strelka+GATK+rtg-tools+SomaticSniper####
RUN cd /software/ && wget https://github.com/samtools/samtools/releases/download/1.18/samtools-1.18.tar.bz2 &&  \
    tar xjvf samtools-1.18.tar.bz2 && cd samtools-1.18 && ./configure --prefix=/software/samtools-v1.18 && make -j20 && make install &&  \
    cd /software/ && wget https://github.com/samtools/bcftools/releases/download/1.18/bcftools-1.18.tar.bz2 &&  \
    tar xjvf bcftools-1.18.tar.bz2 && cd bcftools-1.18 && ./configure --prefix=/software/bcftools-v1.18 && make -j20 && make install &&  \
    cd /software/ && wget https://github.com/samtools/htslib/releases/download/1.18/htslib-1.18.tar.bz2 &&  \
    tar xjvf htslib-1.18.tar.bz2 && cd htslib-1.18 && ./configure --prefix=/software/htslib-v1.18 && make -j20 && make install &&  \
    mkdir -p /software/bedops && cd /software/bedops && wget https://github.com/bedops/bedops/releases/download/v2.4.41/bedops_linux_x86_64-v2.4.41.tar.bz2 &&  \
    tar xjvf bedops_linux_x86_64-v2.4.41.tar.bz2 && rm -rf bedops_linux_x86_64-v2.4.41.tar.bz2 &&  \
    cd /software/ && wget https://github.com/AstraZeneca-NGS/VarDictJava/releases/download/v1.8.3/VarDict-1.8.3.tar && tar xvf VarDict-1.8.3.tar  \
    && wget https://github.com/arq5x/bedtools2/releases/download/v2.31.1/bedtools-2.31.1.tar.gz && tar xzvf bedtools-2.31.1.tar.gz && cd bedtools2 && make -j20 && make install &&  \
    cd /software/ && wget https://github.com/Illumina/manta/releases/download/v1.6.0/manta-1.6.0.release_src.tar.bz2 && tar -xjvf manta-1.6.0.release_src.tar.bz2 &&  \
    mkdir build && cd build && ../manta-1.6.0.release_src/configure --jobs=20 --prefix=/software/manta-v1.6.0 && make -j20 install &&  \
    wget https://github.com/Illumina/strelka/releases/download/v2.9.10/strelka-2.9.10.release_src.tar.bz2 && tar -xjvf strelka-2.9.10.release_src.tar.bz2 &&  \
    mkdir build && cd build && ../strelka-2.9.10.release_src/configure --jobs=20 --prefix=/software/strelka-v2.9.10 && make -j20 install &&  \
    cd /software/ && wget https://github.com/RealTimeGenomics/rtg-tools/releases/download/3.12.1/rtg-tools-3.12.1-linux-x64.zip && unzip rtg-tools-3.12.1-linux-x64.zip \
    && wget https://github.com/broadinstitute/gatk/releases/download/4.4.0.0/gatk-4.4.0.0.zip && unzip gatk-4.4.0.0.zip && \
    wget https://github.com/genome/somatic-sniper/archive/refs/tags/v1.0.5.0.zip && unzip v1.0.5.0.zip && mkdir somatic-sniper-1.0.5.0/build && cd somatic-sniper-1.0.5.0/build && cmake ../ &&  \
    make deps && make -j && make test && \
    cd /software && wget https://github.com/lh3/minimap2/releases/download/v2.26/minimap2-2.26_x64-linux.tar.bz2 && tar xjvf minimap2-2.26_x64-linux.tar.bz2

##gcc 7.1.0+MuSE####
RUN cd /software/ && wget https://mirrors.ustc.edu.cn/gnu/gcc/gcc-7.1.0/gcc-7.1.0.tar.bz2 && tar xjvf gcc-7.1.0.tar.bz2 && cd gcc-7.1.0  \
    && ./contrib/download_prerequisites && rm -rf /software/build/* && cd /software/build && ../gcc-7.1.0/configure  \
    --prefix=/software/gcc-v7.1.0 --enable-languages=c,c++,fortran,go --disable-multilib && make -j20 && make install
COPY htslib-1.9.tar.bz2 gperftools-2.9.1.tar.gz MuSE-2.0.4.tar.gz install_muse.sh /software/
RUN cd /software/ && tar xzvf MuSE-2.0.4.tar.gz && mv install_muse.sh htslib-1.9.tar.bz2 gperftools-2.9.1.tar.gz MuSE-2.0.4/ \
    && cd MuSE-2.0.4 && chmod 777 -R *  && export PATH="/software/gcc-v7.1.0/bin:$PATH" && ./install_muse.sh &&  \
    cd /software/ && rm -rf *.gz *.tgz *.bz2 *.zip *.tar samtools-1.18 bcftools-1.18 htslib-1.18 gcc-7.1.0 build manta-1.6.0.release_src