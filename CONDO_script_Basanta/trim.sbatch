#!/bin/bash


#SBATCH --time=24:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=16   # 16 processor core(s) per node 
#SBATCH --mail-user=  # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --output="trimout.txt" # job standard output file (%j replaced by job id)
#SBATCH --error="trimerror.txt" # job standard error file (%j replaced by job id)

module purge

module load intel

module load allinea

ulimit -s unlimited


module load trimmomatic/0.36-lkktrba


java -jar trimmomatic-0.36.jar SE -phred33 Galaxy10-[PQO-2_S23_L002_R1_001.fastq].fastqsanger Galaxy10-[PQO-2_S23_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy11-[PQO-3_S24_L002_R1_001.fastq].fastqsanger Galaxy11-[PQO-3_S24_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy12-[PQY-1_S19_L002_R1_001.fastq].fastqsanger Galaxy12-[PQY-1_S19_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy13-[PQY-2_S20_L002_R1_001.fastq].fastqsanger Galaxy13-[PQY-2_S20_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy14-[PQY-3_S21_L002_R1_001.fastq].fastqsanger Galaxy14-[PQY-3_S21_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy1-[H2OY-2_S17_L002_R1_001.fastq].fastqsanger Galaxy1-[H2OY-2_S17_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy2-[H2OY-3_S18_L002_R1_001.fastq].fastqsanger Galaxy2-[H2OY-3_S18_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy3-[H2OO-1_S13_L002_R1_001.fastq].fastqsanger Galaxy3-[H2OO-1_S13_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy4-[H2OO-2_S14_L002_R1_001.fastq].fastqsanger Galaxy4-[H2OO-2_S14_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy5-[H2OO-3_S15_L002_R1_001.fastq].fastqsanger Galaxy5-[H2OO-3_S15_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy6-[H2OY-1_S16_L002_R1_001.fastq].fastqsanger Galaxy6-[H2OY-1_S16_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
java -jar trimmomatic-0.36.jar SE -phred33 Galaxy9-[PQO-1_S22_L002_R1_001.fastq].fastqsanger Galaxy9-[PQO-1_S22_L002_R1_001.fastq].fastq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
