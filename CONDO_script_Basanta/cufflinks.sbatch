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
#SBATCH --output="cufflinks.ouyt" # job standard output file (%j replaced by job id)
#SBATCH --error="cufflinks.error"

module purge

ulimit -s unlimited


module load cufflinks/2.2.1-63gfrmo

cufflinks  -g DM6.gtf -p 16  -o PQO2 PQO2.bam
cufflinks  -g DM6.gtf -p 16  -o PQO3 PQO3.bam
cufflinks  -g DM6.gtf -p 16  -o PQY1 PQY1.bam   
cufflinks  -g DM6.gtf -p 16  -o PQY2 PQY2.bam 
cufflinks  -g DM6.gtf -p 16  -o PQY3 PQY3.bam  
cufflinks  -g DM6.gtf -p 16  -o H2OY2 H2OY2.bam 
cufflinks  -g DM6.gtf -p 16  -o H2OY3 H2OY3.bam  
cufflinks  -g DM6.gtf -p 16  -o H2OO1 H2OO1.bam  
cufflinks  -g DM6.gtf -p 16  -o H2OO2 H2OO2.bam  
cufflinks  -g DM6.gtf -p 16  -o H2OO3 H2OO3.bam  
cufflinks  -g DM6.gtf -p 16  -o H2OY1 H2OY1.bam  
cufflinks -g DM6.gtf  -p 16  -o PQO1 PQO1.bam  
