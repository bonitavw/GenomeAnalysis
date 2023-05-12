#!/usr/bin/env Rscript

library("DESeq2")
library("apeglm")
library(ggplot2)
library(pheatmap)


directory <- "/domus/h1/bonitavw/GenomeAnalysis/analysis/06_comparative_genomics/htseq_counts/"

serum_files <- grep("Serum", list.files(directory), value=TRUE)
BH_files <- grep("BH", list.files(directory), value=TRUE)

serum_samples <- sub("_Serum.txt", "", serum_files)
BH_samples <- sub("_BH.txt", "", BH_files)

serum_conditions <- rep("Serum", length(serum_samples))
BH_conditions <- rep("BH", length(BH_samples))

sampleTable <- DataFrame(sampleName = c(BH_samples, serum_samples),
                         fileName = c(BH_files, serum_files),
                         condition = factor(c(BH_conditions, serum_conditions)))

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design = ~condition)
dds <- DESeq(ddsHTSeq)

res <- results(dds)
resFilt <- res[which(res$padj < 0.05 & abs(res$log2FoldChange) > 1),]

topGenes <- head(resFilt[order(resFilt$padj),], n=20)
write.table(topGenes, file = "/domus/h1/bonitavw/GenomeAnalysis/analysis/06_comparative_genomics/topGenes.txt", sep = "\t", quote = FALSE)


## make the MA plot
pdf("/domus/h1/bonitavw/GenomeAnalysis/analysis/06_comparative_genomics/MAplot.pdf")
res <- lfcShrink(dds, coef="condition_Serum_vs_BH", type="apeglm")
plotMA(res, main="MA Plot", ylim=c(-2,2))
dev.off()

## make the histogram
pdf("/domus/h1/bonitavw/GenomeAnalysis/analysis/06_comparative_genomics/histogram.pdf")
hist(res$pvalue[res$baseMean > 1], breaks = 0:20/20,
     col = "grey50", border = "white")
dev.off()

## make the heatmap
pdf("/domus/h1/bonitavw/GenomeAnalysis/analysis/06_comparative_genomics/heatmap.pdf")

topVarGenes <- head(order(rowVars(assay(rlog(dds))), decreasing = TRUE), 20)
mat <- assay(rlog(dds))[ topVarGenes, ]
mat <- mat - rowMeans(mat)
anno <- as.data.frame(colData(rlog(dds))[, c("condition","sizeFactor")])

pheatmap(mat, annotation_col = anno)

dev.off()
