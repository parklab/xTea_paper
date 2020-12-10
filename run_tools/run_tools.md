# Commands to run different tools

## 1. run MELT
```
BAM=HG002_bwa_mem_GRCh38_bam.sorted.bam
REF=./data/reference/GRCh38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna
GENE=./MELTv2.1.4/add_bed_files/Hg38/Hg38.genes.bed

java -Xmx25G -jar ./MELTv2.1.4/MELT.jar Single \
        -c read_depth \
        -h ${REF} \
        -bamfile ${BAM} \
        -n ${GENE} \
        -t hg38_libs.txt \
        -w ./HG002_son2_bam/
```
Here `-c` option is adjusted based on the read depth.

## 2. run Mobster

```

java -Xmx45G -jar ../MobileInsertions-0.2.4.1.jar \
    -properties Mobster.properties \
    -in HG002_bwa_mem_GRCh38.sorted.bam \
    -sn HG002 \
    -out mobster_HG002
```
Parameters within `Mobster.properties`, especially `MINIMUM_SUPPORTING_READS` and `MINIMUM_INITIAL_SPLIT_CLUSTER_READS` are adjusted based on read depth.

## 3. run PALMER

```
PALMER/PALMER --input ./HG002_ccs_2_GRCh38_minimap2.sorted.bam  --workdir ./results --ref_ver GRCh38 --output HG002_ccs_Palmer --type LINE  --ref_fa ./GRCh38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna --chr chr1
```
We failed to run PALMER if we didn't set parameter `--chr`. Thus, we run chromosome by chromosome and then merge the calls. We set the corresponding `--type` option for Alu and SVA.

## 4. run Manta
For configuration:
```
./manta-1.6.0.centos6_x86_64/bin/configManta.py --bam HG002_bwa_mem_GRCh38.sorted.cram --referenceFasta ./GRCh38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna --runDir ./HG002
```
To run:
```
./HG002/runWorkflow.py -j 8
```

## 5. run DELLY
```
delly call -x human.hg38.excl.tsv -o HG002_delly.bcf -g ./GRCh38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna HG002_bwa_mem_GRCh38.sorted.cram
```

## 6. run SVIM

```
svim alignment ./wfolder/ HG002_ccs_2_GRCh38_minimap2.sorted.bam ./GRCh38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna --min_sv_size 50
```

## 7. run cuteSV
```
cuteSV --max_cluster_bias_INS 1000 --diff_ratio_merging_INS 0.9 --max_cluster_bias_DEL 1000 --diff_ratio_merging_DEL 0.5 --threads 8 HG002_ccs_2_GRCh38_minimap2.sorted.bam HG002_ccs_cuteSV.vcf ./wfolder/
```

## 8. run Sniffles
```
sniffles -s 10 -l 30 -m HG002_ccs_2_GRCh38_minimap2_with_MD.sorted.bam -v HG002_ccs_sniffles.vcf --genotype
```
