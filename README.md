# Commands, scripts, and results of the xTea paper

## Commands to run different tools
Folder `run_tools` contains the commands used to run different tools. Each subfolder is for one tool, which contains the results used in the comparisons

## Benchmark data
Folder `benchmark` contains the HG002 benchmarked data (coordinate based on hg38).

## NA12878 L1 calls
Folder `NA12878_L1_cmp` contains the L1 comparison between xTean and another "L1 benchmark" released in the PALMER paper (Zhou, Weichen, et al. NAR 2019).

## Genotype
Folder `Genotype_cmp` contains the comparison with one set of PCR validate genotype "benchmark" (Payer, Lindsay M., et al. PNAS 2017).

## CHM13 Centromeric L1
Folder `CHM13_centromere_L1` contains the RepeatMasker annotation of CHM13 v1.0 assembly and the selected full length centromeric L1. And also xTea's output of the detected ghost L1s.

## Scripts to compare two results
We developped `x_cmp.py` for results comparison. To run it:
```
python x_cmp.py -L --list multi_platform_rslts.txt  --bcmk bcmk.vcf  --extnd 100 -o cmp_multi_platform.rslt
```
Where, 
```
-L: indicates this is comparing a list of results;
--list: is the result list in a file with each line in format `result_path TE-Type ID`;
--bcmk: is the benchmark file;
--extnd: is the slack value when comparing two breakpoints;
-o: is the output prefix
```
