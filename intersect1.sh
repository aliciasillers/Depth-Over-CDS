#!/bin/bash
#
#SBATCH --job-name=intersect1
#SBATCH --ntasks=1 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=20G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=intersect1.out # File to which STDOUT will be written
#SBATCH --error=intersect1.err #  File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1:00:00
#SBATCH --array=1-4

module load bedtools2

file1=$(ls *.gff | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls *.gff | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[/.]' '{print $1}')

bedtools intersect -a ../RNAseq_Michael/Mapped/SRR5241942Aligned.bam -b $file1 > $prefix.SRR5241942.bam

bedtools intersect -a ../RNAseq_Michael/Mapped/SRR5241937Aligned.bam -b $file1 > $prefix.SRR5241937.bam

bedtools intersect -a ../RNAseq_Michael/Mapped/SRR5241935Aligned.bam -b $file1 > $prefix.SRR5241935.bam

bedtools intersect -a ../RNAseq_Michael/Mapped/SRR7157738Aligned.bam -b $file1 > $prefix.SRR7157738.bam

bedtools intersect -a ../RNAseq_Michael/Mapped/SRR7157740Aligned.bam -b $file1 > $prefix.SRR7157740.bam
