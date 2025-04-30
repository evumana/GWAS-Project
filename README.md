# Overview 
Welcome to Dr. Wheeler's lab! This tutorial will introduce you to some essential bioinformatic tools for GWAS and statistical analysis used in the lab. See the Wiki tab to begin! Students will learn to use PLINK2 for handling large genotype data and running GWAS results, and R for data transformation, statistical validation, and visualizing results. The workshop offers a step by step guide with instructions for both Windows and Mac users. 

# Software Requirements
- R
- R studio
- Plink 2
- LocusZoom (web access)

  
#  Required R Packages 
- data.table
- dplyr
- ggplot
- RNOmni
- qqman

# Input Data 
- genotype data
  1) .bed: binary file of genotype calls
  2) .bim: SNP map file (chromosome, position, alleles)
  3) .fam: sample information (individual ID, family ID, gender, phenotype)
- phenotype file: a text file containing phenotype values. Used to asses and normalize phenotype distributions. 
  1) tutorial_phenotype.txt
  2) problem_set_phenotype.txt
 
- population info file: contains population group assignments. Used for PCA plots and visualizing population structure.

# Output Files 
- Plink Outputs
  1) plink2.prune.in/ plink2,prune.out: List of SNPS retained and excluded after LD pruning.
  2) plink2.eigenvec: principal component values per individual.
  3) plink2,eigenval: eigenvals for each principal component.
 
- GWAS results
  1) sampleGWAS.log: log of the GWAS run.
  2) sampleGWAS.RNphenotype.glm.linear: Main results file with regression output per SNP.
  3) sampleGWAS.RNphenotype.glm.linear.adjusted: corrected p-values.
 
- R output
  1) sample_phenotype_RNphenotype.txt: Normalized Phenotype
  2) Manhattan plot
  3) QQ plot
  4) PCA plots
  5) Box plot
 
- LocusZoom output
  1) regional plot showing linkage disequilibrium and top SNPs
 
# Tutorial Workflow

![GWAS tutorial Workflow](https://github.com/user-attachments/assets/23315ced-46c2-43f6-8c4a-c451d193fdfb)

