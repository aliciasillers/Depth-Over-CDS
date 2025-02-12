#!/bin/bash
#
#SBATCH --job-name=intersect3
#SBATCH --ntasks=1 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=20G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=intersect3.out # File to which STDOUT will be written
#SBATCH --error=intersect3.err #  File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=3:00:00

module load bedtools2

bedtools intersect -a Fxa1Ag100440SRR5241935.bed -b Fxa1Ag100440.gff > Fxa1Ag100440SRR5241935.filtered.bed

bedtools intersect -a Fxa1Ag100440SRR5241937.bed -b Fxa1Ag100440.gff > Fxa1Ag100440SRR5241937.filtered.bed

bedtools intersect -a Fxa1Ag100440SRR5241942.bed -b Fxa1Ag100440.gff > Fxa1Ag100440SRR5241942.filtered.bed

bedtools intersect -a Fxa1Ag100440SRR7157738.bed -b Fxa1Ag100440.gff > Fxa1Ag100440SRR7157738.filtered.bed

bedtools intersect -a Fxa1Ag100440SRR7157740.bed -b Fxa1Ag100440.gff > Fxa1Ag100440SRR7157740.filtered.bed

bedtools intersect -a Fxa3Bg103787SRR5241935.bed -b Fxa3Bg103787.gff > Fxa3Bg103787SRR5241935.filtered.bed

bedtools intersect -a Fxa3Bg103787SRR5241937.bed -b Fxa3Bg103787.gff > Fxa3Bg103787SRR5241937.filtered.bed

bedtools intersect -a Fxa3Bg103787SRR5241942.bed -b Fxa3Bg103787.gff > Fxa3Bg103787SRR5241942.filtered.bed

bedtools intersect -a Fxa3Bg103787SRR7157738.bed -b Fxa3Bg103787.gff > Fxa3Bg103787SRR7157738.filtered.bed

bedtools intersect -a Fxa3Bg103787SRR7157740.bed -b Fxa3Bg103787.gff > Fxa3Bg103787SRR7157740.filtered.bed

bedtools intersect -a Fxa3Gg103676SRR5241935.bed -b Fxa3Gg103676.gff > Fxa3Gg103676SRR5241935.filtered.bed

bedtools intersect -a Fxa3Gg103676SRR5241937.bed -b Fxa3Gg103676.gff > Fxa3Gg103676SRR5241937.filtered.bed

bedtools intersect -a Fxa3Gg103676SRR5241942.bed -b Fxa3Gg103676.gff > Fxa3Gg103676SRR5241942.filtered.bed

bedtools intersect -a Fxa3Gg103676SRR7157738.bed -b Fxa3Gg103676.gff > Fxa3Gg103676SRR7157738.filtered.bed

bedtools intersect -a Fxa3Gg103676SRR7157740.bed -b Fxa3Gg103676.gff > Fxa3Gg103676SRR7157740.filtered.bed

bedtools intersect -a Fxa3Gg103727SRR5241935.bed -b Fxa3Gg103727.gff > Fxa3Gg103727SRR5241935.filtered.bed

bedtools intersect -a Fxa3Gg103727SRR5241937.bed -b Fxa3Gg103727.gff > Fxa3Gg103727SRR5241937.filtered.bed

bedtools intersect -a Fxa3Gg103727SRR5241942.bed -b Fxa3Gg103727.gff > Fxa3Gg103727SRR5241942.filtered.bed

bedtools intersect -a Fxa3Gg103727SRR7157738.bed -b Fxa3Gg103727.gff > Fxa3Gg103727SRR7157738.filtered.bed

bedtools intersect -a Fxa3Gg103727SRR7157740.bed -b Fxa3Gg103727.gff > Fxa3Gg103727SRR7157740.filtered.bed
