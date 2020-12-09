FROM centos:7
RUN mkdir -p /software/python3 && rpm --rebuilddb && yum install -y wget rpm yum-metadata-parser yum-plugin-fastestmirror okay-release epel-release python-devel
RUN rpm --rebuilddb && yum install -y axel glibc-devel zlib-devel pigz ncurses-devel libcurl* libjpeg* libpng* java-1.8.0-openjdk* python-xlrd gdb strace gcc-c++ autoconf make cmake epel-release curl tbb-devel java gcc openssl-devel bzip2-devel libffi-devel python-pip axel mysql-devel libcurl Cython python-devel sqlite-devel swig libffi-devel audit libxslt-devel libxml2-devel ncurses-devel
RUN rpm --rebuilddb && yum install -y R python-pip && mkdir ~/.Rcache
##python3
COPY Python-3.7.0.tgz /software/python3/
RUN cd /software/python3/ && tar xvf Python-3.7.0.tgz && cd Python-3.7.0 &&  ./configure --prefix=/software/python3/Python-v3.7.0 --with-ssl && make -j20 && make install && rm ../Python-3.7.0.tgz
RUN pip2 install --upgrade pip && pip2 install pandas==0.23.2 numpy==1.14.4 scipy==1.2.0 matplotlib==2.2.2 seaborn==0.8 pysam==0.15.1 openpyxl==2.5.14 configparser==3.7.5
RUN pip2 install biopython==1.71 pomegranate==0.9.0 PyVCF MySQL-python pysqlite scikit-learn==0.20.0 RSeQC==2.6.6 cutadapt==1.16 tornado==5.1.1 HTSeq CNVkit json5 wheel parse2csv networkx==1.8.1
RUN /software/python3/Python-v3.7.0/bin/pip3 install --upgrade pip && /software/python3/Python-v3.7.0/bin/pip3 install pandas numpy configparser biopython pysam matplotlib HTSeq Cython parse==1.8.2
RUN /software/python3/Python-v3.7.0/bin/pip3 install pomegranate==0.13.4
RUN /software/python3/Python-v3.7.0/bin/pip3 install PyVCF RSeQC cutadapt tornado seaborn scikit-learn edlib CNVkit PyYAML wheel parse2csv openpyxl
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'https://mirrors.tuna.tsinghua.edu.cn/CRAN/'; options(repos = r);" > ~/.Rprofile
RUN wget https://cran.r-project.org/src/contrib/Archive/cghseg/cghseg_1.0.2-1.tar.gz && R CMD INSTALL cghseg_1.0.2-1.tar.gz && rm cghseg_1.0.2-1.tar.gz
RUN Rscript -e "install.packages(\"BiocManager\")" && Rscript -e "options(BioC_mirror=\"http://mirrors.ustc.edu.cn/bioc/\")"
RUN Rscript -e "BiocManager::install(\"ggplot2\")"
RUN Rscript -e "BiocManager::install(\"RCurl\")"
RUN Rscript -e "BiocManager::install(\"DESeq2\")"
RUN Rscript -e "BiocManager::install(\"GSVA\")"
RUN Rscript -e "BiocManager::install(\"gage\")"
RUN Rscript -e "BiocManager::install(\"GenomicRanges\")"
RUN Rscript -e "BiocManager::install(\"GenomicAlignments\")"
RUN Rscript -e "BiocManager::install(\"edgeR\")"
RUN Rscript -e "BiocManager::install(\"clusterProfiler\")"
RUN Rscript -e "BiocManager::install(\"WGCNA\")"
RUN Rscript -e "BiocManager::install(\"biocGraph\")"
RUN Rscript -e "BiocManager::install(\"safe\")"
RUN Rscript -e "BiocManager::install(\"topGO\")"
RUN Rscript -e "BiocManager::install(\"ComplexHeatmap\")"
RUN Rscript -e "BiocManager::install(\"EDASeq\")"
RUN Rscript -e "BiocManager::install(\"KEGGgraph\")"
RUN Rscript -e "BiocManager::install(\"ReportingTools\")"
RUN Rscript -e "BiocManager::install(\"Rgraphviz\")"
RUN Rscript -e "BiocManager::install(\"SPIA\")"
RUN Rscript -e "BiocManager::install(\"hwriter\")"
RUN Rscript -e "BiocManager::install(\"pathview\")"
RUN Rscript -e "BiocManager::install(\"vegan\")"
COPY EnrichmentBrowser_2.4.5_CA_edit.tar.gz /software/
RUN cd /software/ && R CMD INSTALL EnrichmentBrowser_2.4.5_CA_edit.tar.gz && rm EnrichmentBrowser_2.4.5_CA_edit.tar.gz
RUN yum install -y perl-CPAN perl-Test-Simple perl-ExtUtils-CBuilder perl-URI-Escape perl-Set-IntervalTree perl-JSON-XS perl-PerlIO-gzip perl-Carp-Assert perl-DB_File
#######################set workdir##############################
WORKDIR /project/
