# BCBX546_Final_Project
## Group members: Dandan Zhang, Basanta Bista, Ping Kang, Michael Murphy, and Samantha Snodgrass
Our paper of interest: RiboTag Translatomic Profiling of _Drosophila_ oenocytes under aging and oxidative stress
Authors: Kerui Huang, Wenhao Chen, Fang Zhu, Hua Bai
Published: N/A, first posted on bioRxiv Feb 26, 2018
http://dx.doi.org/10.1101/272179

## The description of the contents of repository
Our repository includes a readme file, original information from the paper we work on,the data folder we generated and indivial work from each of five group members.
The original data (Illumina sequencing reads) were too large to include in this github repository, but it is available through the publication. 
Our cuffdiff intermediate and output files were also too large to include in this repository. They can be generated with the scripts included here in `Condo_script_Basanta` and in `cummerbund_analysis_Sam`.
The annotation, heatmap, etc. data files generated from the cuffdiff output files (and then used to generate figures) are included in this repository in their respective folders. 

## Goals of the project
See an example of a well documented study: https://github.com/timbeissinger/Maize-Teo-Scripts
### Provide documentation for an undocumented study
"Each group will identify analyses from this manuscript to reproduce and document using the computational skills and documentation standards you have learned in class"
Include: 
* Downloading, inspecting and describing the data utilized in the study
* Processing the data if necessary to format them for the analysis the group has chosen to reproduce
* Rerunning the analysis described in the manuscript using our personal computers or ISU HPC resources
* Providing visual summaries (_e.g._, ggplot figures) of our results

## Sections of the project
### Computing Differential Expression
This is covered in `condo_scripts_Basanta`
This step starts with the raw reads
* Raw reads are mapped to a reference genome (TopHat2)
* Mapped reads are then processed (Cufflinks)
* Processed reads need to be checked for differential expression between treatments (CuffDiff)
The output is the differentially expressed genes.
This will require HPC resources (Condo)

The output from cuffdiff was further processed in cummeRbund, which is detailed in `cummerbund_analysis_Sam`. 
Essentially, this pulls out siginficantly differentially expressed genes for different comparisons.
This also creates the information needed for recreating the venn diagrams (Figure 3E through 3H).

### Recreating Figures
#### Figure 3:
* PCA between treatments --> this is described in `PCA_Ping`
* Hierarchical clustering of reads with a heat map below the clustering dendrogram indicating differential expression --> this is described in `Heatmaps_Dandan`
#### Figure 4:
* C through H: Enrichment of particular GO terms or proteins/complexes across age --> this is described in `GSEA_analysis_Michael`
* J through K: Heatmaps of expression by treatment types --> this is described in  `Heatmaps_Dandan`

All components of the figures will first be written as a script using the available differential expression data. These scripts will then be re-run using the output from re-running of the differential expression to visualize differences/similarities between differential expression runs. It will also test the ease of creating scripts for the purpose of generating/regenerating figures.  
