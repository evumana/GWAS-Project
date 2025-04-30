library(data.table)
library(dplyr)
library(ggplot2)
library(RNOmni)
library(qqman)

setwd("~/Desktop/New_Gwas_Workshop")

data <- fread("tutorial_phenotype.txt")

## To view the first few lines of the phenotype data:
data[1:3,]

# View the distribution of the phenotype 
# Make histogram 

hist(data$phenotype)
shapiro.test(data$phenotype)

#rank-normalize phenotype
phenoRN = RankNorm(data$phenotype)
hist(phenoRN)

data = mutate(data, RNphenotype = phenoRN)
fwrite(data, 'sample_phenotype_RNphenotype.txt', quote=F, row.names = F,sep="\t")

shapiro.test(phenoRN)

#calc genotype PCs to adjust for pop structure.
#step 1 LD prune SNPs
system("~/Desktop/New_Gwas_Workshop/plink2 --bfile genotypes --indep-pairwise 500kb 0.1")
#step 2, calculate 10 PCs with pruned-in SNPs only and samples with phenotypes
system("~/Desktop/New_Gwas_Workshop/plink2 --bfile genotypes --extract plink2.prune.in --pca 10")

#plot PCs
pcs = fread("plink2.eigenvec")
ggplot(pcs, aes(x=PC1,y=PC2)) + geom_point()

#color by population
popinfo = fread("genotypes_popinfo.txt")
pcs = left_join(pcs,popinfo,by = join_by(IID))
ggplot(pcs, aes(x=PC1,y=PC2,color=population)) + geom_point()

#plink command to generate gwas files
system("~/Desktop/New_Gwas_Workshop/plink2 --bfile genotypes --glm --pheno sample_phenotype_RNphenotype.txt --pheno-name RNphenotype --covar plink2.eigenvec --adjust --out sampleGWAS")

#gwas command
gwas <- fread("sampleGWAS.RNphenotype.glm.linear")

#filtered gwas command to include only additive results
gwas_filtered <- fread("sampleGWAS.RNphenotype.glm.linear") %>%
  filter(TEST == "ADD")

#generating the manhattan and qq plots
manhattan(gwas_filtered,chr="#CHROM",bp="POS",snp="ID")

qq(gwas_filtered$P)


system("~/Desktop/New_Gwas_Workshop/plink2 --bfile genotypes --snp 5:96954943:C:T --recode A --out rs7705093_genotypes")

#reading the genotypes and phenotypes for the boxplot
gts = fread("rs7705093_genotypes.raw")
pts = fread("sample_phenotype_RNphenotype.txt")

#creating the boxplot using the phenotypes and genotypes
names(pts)
names(gts)
merged = merge(pts, gts, by ="IID")

boxplot(merged$RNphenotype~merged$`5:96954943:C:T_C`,
        ylab = "Rank-normalized phenotype",
        xlab = "rs7705093 genotype")