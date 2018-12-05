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
#SBATCH --output="cuffmergje.ouyt" # job standard output file (%j replaced by job id)
#SBATCH --error="cuffmergej.error"

module purge

ulimit -s unlimited


module load cufflinks/2.2.1-63gfrmo

cuffmerge -g DM6.gtf -s DM6.fa -p 16 -o merge assemblies.txt
