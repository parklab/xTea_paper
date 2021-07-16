# Output information

## Convert short reads output to VCF (this step will be automatically in the pipeline)

```

python /path/x_TEA_main.py --gVCF -i candidate_sites.txt  -o output.vcf -b bam_file_list.txt --ref reference_genome.fa --rtype 1
```

## Long read output (by column)
```
chrm: chromosome
pos: insertion position
type: type of insertion
structure: internal structural variation
left segment start:end:orientation: start-position:end-position(on consensus):orientation of the left segment (when internal SV happen, the insertion is broken to segments)
right segment start:end:orientation: start-position:end-position(on consensus):orientation of the right segment (if only one segment, then none)
TSD: target site duplication sequence
5' transduction: 5' transduction information (position)
3' transduction: 3' transduction information (position)
insertion sequence: sequence of the assembled insertion
5' transduction sequence: sequence of the 5' transduction
3' transduction sequence: sequence of the 3' transduction
polyA: whether there is a polyA tail detected
```


