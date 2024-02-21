
bioinformatic
```{.cs}
/software/bwa-0.7.17/bwa
/software/samtools-v1.18/bin/samtools
/software/bcftools-v1.18/bin/bcftools
/software/seqtk-1.4/seqtk
sh -c "export LD_LIBRARY_PATH=/software/htslib-v1.18/lib:$LD_LIBRARY_PATH && /software/pindel-0.2.5b8/pindel"
sh -c "export PATH=/software/gcc-v7.1.0/bin:$PATH && export LD_LIBRARY_PATH=//software/gcc-v7.1.0/lib64/:$LD_LIBRARY_PATH && /software/MuSE-2.0.4/MuSE"
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
/usr/bin/genefuse
/usr/bin/msisensor-pro
/usr/bin/sambamba-1.0.1-linux-amd64-static
/usr/bin/delly_v1.1.8_linux_x86_64bit
/software/openlogic-openjdk-jre-17.0.9+9-linux-x64/bin/java -jar /usr/bin/picard.jar
/software/openlogic-openjdk-jre-17.0.9+9-linux-x64/bin/java -jar /usr/bin/abra2-2.24.jar
/software/openlogic-openjdk-jre-17.0.9+9-linux-x64/bin/java -jar /usr/bin/fgbio-2.1.0.jar

```