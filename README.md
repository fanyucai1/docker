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

linux lib
```{.cs}
strace enscript curl wget swig bzip2 ghostscript autoconf automake cmake Cython
    glibc-devel zlib-devel python-devel libcurl libpng libcurl-devel bzip2-devel
    libtool-ltdl libtool-ltdl-devel libxml2-devel pigz ncurses-devel libffi-devel libxslt-devel sqlite-devel tbb-devel audit audit-libs audit-libs-devel
    gcc-gfortran libicu-devel make openblas-devel pango pcre2-devel tcl tk unzip which zip
    perl-CPAN perl-IPC-Cmd perl-WWW-Curl java-11-openjdk java-11-openjdk-devel gcc gcc-c++ glibc-headers
```

/software/Python-v3.11.0/bin/python3
```{.cs}
tensorflow scikit-learn PyVCF RSeQC cutadapt tornado seaborn edlib CNVkit 
PyYAML wheel parse2csv openpyxl pandas numpy configparser biopython 
pysam matplotlib  Cython parse CrossMap cryptography easycython HTSeq 
seaborn matplotlib pandas
```

R
```{.cs}
BiocManager tidyverse Rgraphviz SPIA hwriter,
    hwriter pathview WGCNA DESeq2 vegan edgeR clusterProfilerm
    RCurl GSVA gage GenomicRanges GenomicAlignments
    biocGraph safe topGO ComplexHeatmap KEGGgraph EDASeq ReportingTools
```

bioinformatic
```{.cs}
/software/bwa/bwa
/usr/bin/fastp
/software/samtools-v1.18/bin/samtools
/software/bcftools-v1.18/bin/bcftools
```


FROM centos:7

Docker file link:

[Dockerfile:https://github.com/fanyucai1/docker/tree/master/base](https://github.com/fanyucai1/docker/tree/master/base)

linux lib
```{.cs}
strace enscript curl wget swig bzip2 ghostscript autoconf automake cmake Cython
    glibc-devel zlib-devel python-devel libcurl libpng libcurl-devel bzip2-devel
    libtool-ltdl libtool-ltdl-devel libxml2-devel pigz ncurses-devel libffi-devel libxslt-devel sqlite-devel tbb-devel audit audit-libs audit-libs-devel
    gcc-gfortran libicu-devel make openblas-devel pango pcre2-devel tcl tk unzip which zip
    perl-CPAN perl-IPC-Cmd perl-WWW-Curl java-11-openjdk java-11-openjdk-devel gcc gcc-c++ glibc-headers
```

/software/Python-v3.11.0/bin/python3
```{.cs}
tensorflow scikit-learn PyVCF RSeQC cutadapt tornado seaborn edlib CNVkit 
PyYAML wheel parse2csv openpyxl pandas numpy configparser biopython 
pysam matplotlib  Cython parse CrossMap cryptography easycython HTSeq 
seaborn matplotlib pandas
```

R
```{.cs}
BiocManager tidyverse Rgraphviz SPIA hwriter
    hwriter pathview WGCNA DESeq2 vegan edgeR clusterProfilerm
    RCurl GSVA gage GenomicRanges GenomicAlignments
    biocGraph safe topGO ComplexHeatmap KEGGgraph EDASeq ReportingTools
```
bioinformatic
```{.cs}
/software/bwa-0.7.17/bwa
/software/samtools-v1.18/bin/samtools
/software/bcftools-v1.18/bin/bcftools
sh -c "export LD_LIBRARY_PATH=/software/htslib-v1.18/lib:$LD_LIBRARY_PATH && /software/pindel-0.2.5b8/pindel"
sh -c "export PATH=/software/gcc-v7.1.0/bin:$PATH && export LD_LIBRARY_PATH=//software/gcc-v7.1.0/lib64/:$LD_LIBRARY_PATH && /software/MuSE-2.0.4/MuSE"
/software/seqtk/seqtk
/software/bedtools2/bin/bedtools
/software/strelka-v2.9.10/bin/configureStrelkaGermlineWorkflow.py
/software/strelka-v2.9.10/bin/configureStrelkaSomaticWorkflow.py
/software/manta-v1.6.0/bin/configManta.py
/software/somatic-sniper-1.0.5.0/build/bin/bam-somaticsniper
/software/VarDict-1.8.3/bin/VarDict
/software/minimap2-2.26_x64-linux/minimap2
/software/rtg-tools-3.12.1/rtg
/software/bedops/bin/bedops
/software/gatk-4.4.0.0/gatk
/usr/bin/fastp
/usr/bin/msisensor-pro
/usr/bin/sambamba-1.0.1-linux-amd64-static
/usr/bin/delly_v1.1.8_linux_x86_64bit
/software/openlogic-openjdk-jre-17.0.9+9-linux-x64/bin/java -jar /usr/bin/picard.jar
/software/openlogic-openjdk-jre-17.0.9+9-linux-x64/bin/java -jar /usr/bin/abra2-2.24.jar
/software/openlogic-openjdk-jre-17.0.9+9-linux-x64/bin/java -jar /usr/bin/fgbio-2.1.0.jar

```
