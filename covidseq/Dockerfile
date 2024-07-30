FROM base
RUN /opt/conda/bin/conda install conda-forge::mamba &&  \
    apk add --no-cache git && git clone https://github.com/cov-lineages/pangolin.git &&  \
    cd /pangolin/ && /opt/conda/bin/mamba env create -f environment.yml --name pangolin && /opt/conda/envs/pangolin/bin/pip install . && rm -rf /pangolin/ && \
    /opt/conda/bin/mamba create --name micro_freyja_nextclade --channel conda-forge --channel bioconda --channel defaults --channel agbiome  \
    freyja cdhit fastp ivar=1.3 trimmomatic bowtie2 kallisto minimap2 bbmap seqtk kraken2 krakentools samtools bcftools jvarkit bedtools seaborn pyvcf matplotlib numpy pysam pandas &&  \
    cd /opt/conda/envs/micro_freyja_nextclade/bin/ && wget -O nextclade https://github.com/nextstrain/nextclade/releases/latest/download/nextclade-x86_64-unknown-linux-gnu && chmod u+x ./nextclade &&  \
    /opt/conda/bin/conda clean -a -y