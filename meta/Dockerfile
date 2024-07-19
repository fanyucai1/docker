FROM base
RUN /opt/conda/bin/conda install conda-forge::mamba &&  \
    /opt/conda/bin/mamba create --name rgi --channel conda-forge --channel bioconda --channel defaults rgi && \
    /opt/conda/bin/conda install -c bioconda -c conda-forge -c defaults quast kraken2 krakentools  \
    minimap2 megahit cd-hit seqtk spades hmmer freebayes resfinder fastp \
    && /opt/conda/bin/conda clean -a -y
