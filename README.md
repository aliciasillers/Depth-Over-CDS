# Depth Over Coding Sequence

Scripts to generate a plot of read depth at each nucleotide over the coding sequence of a gene.

1. Create conda environment

2. Filter annotation file to coding sequence of genes of interest: filtergff.sh

3. Create bases.bed file, which has coordinates of every nucleotide in the genome

4. Intersect bam files of rnaseq data of interest with filtered gff files: intersect1.sh

5. Intersect filtered bam file with bases.bed file, counting number of overlaps: intersect2.sh

6. Intersect counted bed file with filtered gff file to get bed file with only gene coding sequence coordinates: intersect3.sh

7. Plot in R: plot.sh
