# GWAS Workshop Project Design Document
Aaron Juco, Yusef Golzar, Rumyr Sobrepena, and Evelyn Umana

# Overview
Genome Wide Association Studies (GWAS) are studies that are extremely important in helping scientists identify what genes are associated with certain phenotypes. They have become more widely used in the past ten years as the technology has improved and become more popular. The method uses Single Nucleotide Polymorphisms (SNPs), which are small variations in the genome, as the variable being studied. Researchers gather the genomes of a large group of subjects, then identify SNPs that occur more frequently in the genomes of people with the desired phenotype. GWAS is extremely efficient in that it can observe hundreds of thousands of SNPs at the same time. Once SNPs identified with certain diseases have been identified, this information can be used to help determine an individual's likelihood of developing a disease. GWAS has also been used to assess what an individual's response to a drug may be (Medline Genetics). An important statistic in GWAS is Linkage Disequilibrium (LD), which can be used to pre-screen the genome and select SNPs for genotyping. Linkage disequilibrium simply refers to how often two alleles are observed together within a population (Pritchard and Przeworski). 

Various software tools are used to analyze, interpret, and visualize GWAS results. One tool used to analyze GWAS is called PLINK. PLINK performs a wide variety of large-scale analysis techniques, specifically on position-based SNP data. The original workshop we were given uses an older version of PLINK, which was more recently updated to PLINK 2. The newer version has an overall update to the speed, efficiency, and functionality of the software. PLINK has different file types for data analysis, such as .ped (short for pedigree) and .map, which contains data such as IDs and phenotypes or chromosome number and snp identifiers, respectively. While PLINK helps with the initial analysis of GWAS data, LocusZoom is a tool that helps to visualize the finished data. It takes the PLINK output as its input, and plots the results in an interpretable form that can be converted to .png image formats for accessibility. In this tutorial, there will be many different types of data that will be visualized in their appropriate graphs. For example, a Manhattan Plot can be used to visualize the -log10(p) values vs each chromosome number. 

With the genotype, file formats, and translations in the tutorial being updated, the visualizations will consequently become different as well. To be consistent with the new data, we will be changing the “storyline” of the tutorial to correspond with our new results. Our initial idea for the data is to play with the phenotypes of LUwolf, the Loyola mascot. 




# References 
Pritchard, J K, and M Przeworski. “Linkage disequilibrium in humans: models and data.” 
American journal of human genetics vol. 69,1 (2001): 1-14. doi:10.1086/321275

“What Are Genome-Wide Association Studies?: Medlineplus Genetics.” MedlinePlus, U.S. National Library of Medicine, 
medlineplus.gov/genetics/understanding/genomicresearch/gwastudies/#:~:text=Genome
%2Dwide%20association%20studies%20(GWAS,(pronounced%20“snips”). Accessed 16 
Mar. 2025. 

# Context 
We were presented with a 10+ year old tutorial that trains new students from Dr. Wheeler’s lab to use GWAS research methods. Genome-wide association studies (GWAS) is a fundamental tool in genetics. It allows researchers to identify genetic variants associated with traits or diseases. Conducting GWAS correctly requires an updated workflow, proper data formats, and modernized tools to ensure reproducible results. The current GWAS workshop in Dr. Wheeler’s lab has not been updated in over 10+ years and relies on older SNP genotypes and an old version of software. To modernize and improve the GWAS workshop we are going to update the genotype data, use PLINK2, improve documentation, and add demos on PCA plots. Many students enter Dr. Wheeler’s lab with limited computational experience. By structuring the GWAS workshop as a guided tutorial we can ensure that students can conduct GWAS effectively. By updating the genotype data, analysis tool, documentation, and visualization pipeline we will create a structured and effective training resource for students.

# Goals
- To revamp the existing GWAS Workshop repository to become more user-friendly by:

    - Use the newer and denser SNP genotypes (Genome Build: hg38)

    - Teaching the user RStudio and PLINK2 functions by guiding them through phenotype change stories with LUWolf

    - Updated demos of PLINK2 file formats (map/pd, bed/bim/fam, and pgen/pvar/psam)

    - Freshly formatted Github wiki with step-by-step screenshots, which will include locuszoom directions and interpretation
 
    - Add demo for PCA plots. 


# Non-Goals 

- To not make it specific towards any IDE

- To not diverge too far from the simplicity in the original tutorial


# Proposed Solution 
Steps:
1. Create New story for new phenotype
2. Create wiki in the GitHub repo
3. Write tutorial on the following using Mac OS X and Windows Powershell:
- GWAS Introduction
- Install R and R studio
- Download GWAS data
- Download the GWAS_workshop2.zip file from https://github/evumana/GWAS-Project
4. Modernize the Analysis Pipeline with the following:
- Install PLINK2
- Download: https://www.cog-genomics.org/plink/2.0/
- Test PLINK2
- Introduction to dataset
5. Visualize Results 
- View distribution of our phenotype in R

        Input: txt file

        Output: histogram of data

- Transform the phenotype in R
  
        Input: histogram of data

        Output: normal distribution of histogram data

- Perform a Shapiro-Wilk test and create plots
  
        Input: histogram and table of dataset

        Output: normal distribution analysis 

- Add phenotype data to data file
- Run the GWAS using PLINK2
  
        Input: txt file and phenotype data

        Output: GWAS “.log”, “.assoc.linear”, and “.assoc.linear.adjusted” files

- Make a Q-Q plot and Manhattan Plot in R
  
        Input: GWAS “.assoc.linear” file

        Output: Q-Q plot and Manhattan Plot of data

- Use LocusZoom (http://locuszoom.org/) to plot regional association results from GWAS
  
        Input: GWAS “.assoc.linear” file

        Output: LocusZoom plots
  
- Make boxplot of top SNP using R

        Input: genotypes file

        Output: Boxplot of top SNP

- Make PCA plot of data using R 

        Input: genotype file 

        Output: PCA plot

# Workflow 

![GWAS Workflow Diagram](https://github.com/user-attachments/assets/ee51b652-24f6-48c6-b875-5add208d3cd6)

1. Update Data Files
- Convert genotype data to a denser SNP set (hg38)
- Create new phenotype files that align with new story
- Instructing users on how to check the data they are running.
2. Modernize the GWAS Analysis Pipeline
- Replace outdated tools with PLINK2 to support .pgen, .pvar, and .psam format.
3. Improve Documentation
- Move instructions from .Rmd/.html files to a structured Github Wiki.
- Include step by step guide for Windows and Mac users with screenshots
4. Improve Data Visualization and Interpretation
- Provide a LocusZoom tutorial for regional association plots.
- Generate Manhattan and QQ plots for GWAS results.
5. Complete Problem Set With New Data
- Make new answer key. 


# Importance of Tasks 

1. Preparing data to ensure genotyping accuracy by filtering low quality SNPS, removing genotyping errors, low MAF variants, and deviations from Hardy-Weinberg equilibrium.
2. Run GWAS analysis and get results for downstream interpretation and train users in using PLINK2.
3. Update documentation and Github Wiki so that future users can quickly understand how to run the tools.
4. Visualize plots to make results more interpretable.

#  Milestones 

<img width="724" alt="Screen Shot 2025-03-18 at 9 47 18 AM" src="https://github.com/user-attachments/assets/23c95180-31a0-41ca-8fec-81b253c21d91" />

this is a test- yusef
