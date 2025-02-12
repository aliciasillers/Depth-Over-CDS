#!/bin/bash
#
#SBATCH --job-name=intersect2
#SBATCH --ntasks=1 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=20G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=intersect2.out # File to which STDOUT will be written
#SBATCH --error=intersect2.err #  File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1:00:00
#SBATCH --array=1-20

module load bedtools2

file1=$(ls *.bam | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls *.bam | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[/.]' '{print $1$2}')

bedtools intersect -a ../Genome/Nomenclature_Update/bases.bed -b $file1 -f 1 -c > $prefix.bed

