#!/bin/bash


#SBATCH --time=5:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=16   # 16 processor core(s) per node 
#SBATCH --mail-user=bbista@iastate.edu   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --output="qcrunrun.txt" # job standard output file (%j replaced by job id)
#SBATCH --error="eqctest.txt" # job standard error file (%j replaced by job id)

module purge

module load intel

module load allinea

ulimit -s unlimited

module use /opt/rit/modules
module load fastqc/0.11.3



fastqc Galaxy10-[PQO-2_S23_L002_R1_001.fastq].fastqsanger
fastqc Galaxy11-[PQO-3_S24_L002_R1_001.fastq].fastqsanger
fastqc Galaxy12-[PQY-1_S19_L002_R1_001.fastq].fastqsanger
fastqc Galaxy13-[PQY-2_S20_L002_R1_001.fastq].fastqsanger
fastqc Galaxy14-[PQY-3_S21_L002_R1_001.fastq].fastqsanger
fastqc Galaxy1-[H2OY-2_S17_L002_R1_001.fastq].fastqsanger
fastqc Galaxy2-[H2OY-3_S18_L002_R1_001.fastq].fastqsanger
fastqc Galaxy3-[H2OO-1_S13_L002_R1_001.fastq].fastqsanger
fastqc Galaxy4-[H2OO-2_S14_L002_R1_001.fastq].fastqsanger
fastqc Galaxy5-[H2OO-3_S15_L002_R1_001.fastq].fastqsanger
fastqc Galaxy6-[H2OY-1_S16_L002_R1_001.fastq].fastqsanger
fastqc Galaxy9-[PQO-1_S22_L002_R1_001.fastq].fastqsanger


java -jar trimmomatic-0.30.jar SE s_1_1_sequence.txt.gz lane1_forward.fq.gz
ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15
MINLEN:36

