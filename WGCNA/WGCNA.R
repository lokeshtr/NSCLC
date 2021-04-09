# set your workling directory here, where this particular .R file is present
setwd("F:/NIBIOHN github/GITHUB/NIBIOHN-NSCLC/WGCNA");

# Install the following packages if not present
library(WGCNA)
#install.packages("stringr")
library(stringr)
#install.packages("WGCNA")
#source("http://bioconductor.org/biocLite.R") 
#biocLite(c("AnnotationDbi", "impute", "GO.db", "preprocessCore"))
#biocLite("GO.db")



library(preprocessCore)
library(WGCNA);
enableWGCNAThreads(12)
data=read.csv("original_data_with_412_genes1.csv",header=TRUE)
datSummary=data[,1:1];
dim(data)
data = t(data[,1: ncol(data)]);


#data <- read.csv("gene_expressions.csv",header=TRUE)
rownames(data) <- data$Gene.ID
#rownames$Gene.ID <- NULL
net <- blockwiseModules(t(data), power = 14, deepSplit = 2)
unique(net$colors)
plotDendroAndColors(net$dendrograms[[1]], colors = net$colors[net$goodGenes], hang =-1)
unique(net$colors)


library(RColorBrewer)
#coul <- colorRampPalette(brewer.pal(8, "BuPu"))(30)

coul <- colorRampPalette(c("blue", "red"), space = "rgb")(100)

heatmap(data.matrix(data[net$colors=="blue",]),col=coul,scale = "column")
heatmap(data.matrix(data[net$colors=="turquoise",]),scale="column",col=coul)
heatmap(data.matrix(data[net$colors=="grey",]),col=coul,scale="column")

gene_colour<- data.frame(gene=rownames(data), colors=net$colors)
write.csv(gene_colour, "genevscolors.csv")

