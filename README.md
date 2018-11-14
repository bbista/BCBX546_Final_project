# BCBX546_Final_project
## Group members: Dandan Zhang, Basanta Bista, Ping Kang, Michael Murphy, and Samantha Snodgrass
Our paper of interest: RiboTag Translatomic Profiling of _Drosophila_ oenocytes under aging and oxidative stress
Authors: Kerui Huang, Wenhao Chen, Fang Zhu, Hua Bai
Published: N/A, first posted on bioRxiv Feb 26, 2018
http://dx.doi.org/10.1101/272179

## Criteria for the project
See an example of a well documented study: https://github.com/timbeissinger/Maize-Teo-Scripts
###Provide documentation for an undocumented study
"Each group will identify analyses from this manuscript to reproduce and document using the computational skills and documentation standards you have learned in class"
Include: 
* Downloading, inspecting and describing the data utilized in the study
* Processing the data if necessary to format them for the analysis the group has chosen to reproduce
* Rerunning the analysis described in the manuscript using your personal computers or ISU HPC resources
* Providing visual summaries (_e.g._, ggplot figures) of your results

###GitHub Repository Requirements
"This documentation should be clear and easy to follow and should adhere to the guidelines for the ReScience Journal."
Include:
* A top README.md file that describes the contents of your directory
* An author(s)-YEAR.md file that introduces the original paper, explains the technical details of your replication of analyses and summarizes your replication of the original results
* A code directory that contains the commented code for the replication
* A data directory that contains links to data necessary to run your code

###In-Class Presentation
"Each group will have ~20 minutes to present their work on either December 5th or 7th. Each presentation should include:"
* Background on the biological question being investigated
* A escription of the workflow carried out by the group
* An overview of the group's documentation
* Presentation of results including comparison to results from the published paper

## Sections of the project
### Running Computing Differential Expression
This step starts with the raw reads
* Raw reads are mapped to a reference genome (TopHat2)
* Mapped reads are then processed (Cufflinks)
* Processed reads need to be checked for differential expression between treatments (CuffDiff)
The output is the differentially expressed genes (file type?)
This will require HPC resources (Condo)

### Recreating Figures
####Figure 3:
* PCA between treatments(?)
* Identify which GO terms are associated with up and down expression between young and aged groups within treatments
* Hierarchical clustering of reads/GO terms (?) with a heat map below the clustering dendrogram indicating differential expression
* J and K show GO term enrichment for cluster 3 and 5 respectively
####Figure 4:
* C through H: Enrichment of particular GO terms or proteins/complexes across age
* I through K: Heatmaps of expression by treatment types
####Figure 5:
* Fold change graphs for particular genes associated with important pathways dealing with oxidative stress

All components of the figures will first be written as a script using the available differential expression data. These scripts will then be re-run using the output from re-running of the differential expression to visualize differences/similarities between differential expression runs. It will also test the ease of creating scripts for the purpose of generating/regenerating figures.  
