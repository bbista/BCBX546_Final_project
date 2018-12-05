#!/bin/bash

# Copy/paste this job script into a text file and submit with the command:
#    sbatch thefilename

#SBATCH --time=72:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=16   # 16 processor core(s) per node 
#SBATCH --job-name="tophat"
#SBATCH --mail-user=   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --output="tophat.out" # job standard output file (%j replaced by job id)
#SBATCH --error="tophat.error"

module purge

ulimit -s unlimited

module load tophat/2.1.1-py2-cuda9-openmpi3-xp77ege


tophat2 -G DM6.gff -o PQO2 DM6 Galaxy10-[PQO-2_S23_L002_R1_001.fastq].fastq
tophat2 -G DM6.gff -o PQO3 DM6 Galaxy11-[PQO-3_S24_L002_R1_001.fastq].fastq 
tophat2 -G DM6.gff -o PQY1 DM6 Galaxy12-[PQY-1_S19_L002_R1_001.fastq].fastq 
tophat2 -G DM6.gff -o PQY2 DM6 Galaxy13-[PQY-2_S20_L002_R1_001.fastq].fastq 
tophat2 -G DM6.gff -o PQY3 DM6 Galaxy14-[PQY-3_S21_L002_R1_001.fastq].fastq 
tophat2 -G DM6.gff -o H2OY2 DM6 Galaxy1-[H2OY-2_S17_L002_R1_001.fastq].fastq
tophat2 -G DM6.gff -o H2OY3 DM6 Galaxy2-[H2OY-3_S18_L002_R1_001.fastq].fastq
tophat2 -G DM6.gff -o H2OO1 DM6 Galaxy3-[H2OO-1_S13_L002_R1_001.fastq].fastq
tophat2 -G DM6.gff -o H2OO2 DM6 Galaxy4-[H2OO-2_S14_L002_R1_001.fastq].fastq
tophat2 -G DM6.gff -o H2OO3 DM6 Galaxy5-[H2OO-3_S15_L002_R1_001.fastq].fastq
tophat2 -G DM6.gff -o H2OY1 DM6 Galaxy6-[H2OY-1_S16_L002_R1_001.fastq].fastq
tophat2 -G DM6.gff -o PQO1 DM6 Galaxy9-[PQO-1_S22_L002_R1_001.fastq].fastq

     
