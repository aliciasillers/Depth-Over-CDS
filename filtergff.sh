#!/bin/bash
#
#SBATCH --job-name=filtergff
#SBATCH --ntasks=1 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=20G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=filtergff.out # File to which STDOUT will be written
#SBATCH --error=filtergff.err #  File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1:00:00

grep 'Fxa1Ag100440.1.CDS' ../Genome/Nomenclature_Update/farr1_updated.gene_models.gff > Fxa1Ag100440.gff

grep 'Fxa3Bg203787.1.CDS' ../Genome/Nomenclature_Update/farr1_updated.gene_models.gff > Fxa3Bg203787.gff

grep 'Fxa3Gg103676.1.CDS' ../Genome/Nomenclature_Update/farr1_updated.gene_models.gff > Fxa3Gg103676.gff

grep 'Fxa3Gg103727.1.CDS' ../Genome/Nomenclature_Update/farr1_updated.gene_models.gff > Fxa3Gg103727.gff
