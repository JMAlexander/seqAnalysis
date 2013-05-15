Developmental cells -- replicates, TSS
========================================================

### Define developmentally regulated sets

```r
library(mclust)
```

```
## Package 'mclust' version 4.1
```


```
rna <- readRDS("~/s2/analysis/rna/rdata/omp_ngn_icam_mrna_ucsc_fpkm_1log2.rds")
rna <- rna[-grep("Olfr", rna$id),]
#rownames(rna) <- rna$id
```

```
mc <- apply(rna[,1:3], 2, function(x) Mclust(x, G=2, modelName="E"))
```

```
mc.u2 <- lapply(mc, function(x) {
  a <- as.logical(x$classification-1)
  names(a) <- names(x$classification)
  return(a)})
```

```
bool.matrix <- matrix(NA, nrow=nrow(rna), ncol=3, dimnames=list(rna$id, c("omp", "ngn", "icam")))
for (i in 1:3) {
  bool.matrix[,i] <- mc.u2[[i]][match(rownames(bool.matrix), names(mc.u2[[i]]))] 
}
bool.matrix <- na.omit(bool.matrix)
```

```
omp.sp <- bool.matrix[apply(bool.matrix, 1, function(x) x[1] & !(x[2] | x[3])),]
ngn.sp <- bool.matrix[apply(bool.matrix, 1, function(x) x[2] & !(x[1] | x[3])),]
icam.sp <- bool.matrix[apply(bool.matrix, 1, function(x) x[3] & !(x[2] | x[1])),]
omp.ngn <- bool.matrix[apply(bool.matrix, 1, function(x) (x[1] & (x[2]) & ! x[3])),]
ngn.icam <- bool.matrix[apply(bool.matrix, 1, function(x) (x[2] & (x[3]) & ! x[1])),]
```

```
rna$class <- NA
rna$class[rna$id %in% rownames(omp.sp)] <- "mosn-specific"
rna$class[rna$id %in% rownames(ngn.sp)] <- "gbc-specific"
rna$class[rna$id %in% rownames(icam.sp)] <- "hbc-specific"
rna$class[rna$id %in% rownames(omp.ngn)] <- "mosn/gbc-common"
rna$class[rna$id %in% rownames(ngn.icam)] <- "gbc/hbc-common"
```

```
tss <- read.delim("~/lib/annotations_hires/refGene_noRandom_order_outsides2_tss_W25F200", header=F)
```

```
write.table(tss[tss[,4] %in% rownames(omp.sp),], file="~/lib/annotations_hires/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam", quote=F, sep="\t", row.names=F, col.names=F)
write.table(tss[tss[,4] %in% rownames(ngn.sp),], file="~/lib/annotations_hires/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam", quote=F, sep="\t", row.names=F, col.names=F)
write.table(tss[tss[,4] %in% rownames(icam.sp),], file="~/lib/annotations_hires/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn", quote=F, sep="\t", row.names=F, col.names=F)
write.table(tss[tss[,4] %in% rownames(omp.ngn),], file="~/lib/annotations_hires/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam", quote=F, sep="\t", row.names=F, col.names=F)
write.table(tss[tss[,4] %in% rownames(ngn.icam),], file="~/lib/annotations_hires/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp", quote=F, sep="\t", row.names=F, col.names=F)
```



```r
suppressPackageStartupMessages(source("~/src/seqAnalysis/R/profiles2.R"))
suppressPackageStartupMessages(source("~/src/seqAnalysis/R/image.R"))
suppressPackageStartupMessages(source("~/src/seqAnalysis/R/modeling.R"))
```



```r
makeProfile2.allSamp("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_chr"
## Note: next may be used in wrong context: no loop is visible
```

```
## Error: task 1 failed - "no loop for break/next, jumping to top level"
```

```r
makeProfile2.allSamp("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_chr"
## Note: next may be used in wrong context: no loop is visible
```

```
## Error: task 1 failed - "no loop for break/next, jumping to top level"
```

```r
makeProfile2.allSamp("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_chr"
## Note: next may be used in wrong context: no loop is visible
```

```
## Error: task 1 failed - "no loop for break/next, jumping to top level"
```

```r
makeProfile2.allSamp("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_chr"
## Note: next may be used in wrong context: no loop is visible
```

```
## Error: task 1 failed - "no loop for break/next, jumping to top level"
```

```r
makeProfile2.allSamp("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_chr"
## Note: next may be used in wrong context: no loop is visible
```

```
## Error: task 1 failed - "no loop for break/next, jumping to top level"
```



```r
positionMatrix.all("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_chr", 
    data_type = "rpkm/mean")
positionMatrix.all("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_chr", 
    data_type = "rpkm/mean")
positionMatrix.all("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_chr", 
    data_type = "rpkm/mean")
positionMatrix.all("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_chr", 
    data_type = "rpkm/mean")
positionMatrix.all("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_chr", 
    data_type = "rpkm/mean")
```



```r
samples <- c("omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup", 
    "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup", "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup")
o.ni <- lapply(samples, function(x) makeImage(x, "refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_chr", 
    data_type = "rpkm/mean", image = F))
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_chr/images/omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_chr/images/ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_chr/images/icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup"
```

```r
on.i <- lapply(samples, function(x) makeImage(x, "refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_chr", 
    data_type = "rpkm/mean", image = F))
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_chr/images/omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_chr/images/ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_chr/images/icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup"
```

```r
n.oi <- lapply(samples, function(x) makeImage(x, "refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_chr", 
    data_type = "rpkm/mean", image = F))
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_chr/images/omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_chr/images/ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_chr/images/icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup"
```

```r
ni.o <- lapply(samples, function(x) makeImage(x, "refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_chr", 
    data_type = "rpkm/mean", image = F))
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_chr/images/omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_chr/images/ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_chr/images/icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup"
```

```r
i.on <- lapply(samples, function(x) makeImage(x, "refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_chr", 
    data_type = "rpkm/mean", image = F))
```

```
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_chr/images/omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_chr/images/ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup"
## [1] "/media/storage2/analysis/profiles/norm/rpkm/mean/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_chr/images/icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup"
```

```r

comb <- list(o.ni, on.i, n.oi, ni.o, i.on)
for (i in 1:length(comb)) names(comb[[i]]) <- c("omp", "ngn", "icam")
```



Significance testing

```r
perm <- lapply(comb, permutationTest.matList)
```

```
## [1] "omp" "ngn"
## [1] "omp"  "icam"
## [1] "ngn"  "icam"
## [1] "omp" "ngn"
## [1] "omp"  "icam"
## [1] "ngn"  "icam"
## [1] "omp" "ngn"
## [1] "omp"  "icam"
## [1] "ngn"  "icam"
## [1] "omp" "ngn"
## [1] "omp"  "icam"
## [1] "ngn"  "icam"
## [1] "omp" "ngn"
## [1] "omp"  "icam"
## [1] "ngn"  "icam"
```




```r
plot2.several("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_chr", 
    "cells_hmc_rep", data_type = "rpkm/mean", group2 = "trim0.01", cols = col3, 
    lab = "TSS", y.vals = c(0, 1.4))
```

```
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01"
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01_mean"
```

```
## [1] 0.0 1.4
```

```r
plotSigLine(perm[[1]][, 2], step = 5, yval = 1.3, col = col3[1])
```

![plot of chunk refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_omp_ngn_icam_rep](figure/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_vs_ngn_icam_omp_ngn_icam_rep.png) 



```r
plot2.several("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_chr", 
    "cells_hmc_rep", data_type = "rpkm/mean", group2 = "trim0.01", cols = col3, 
    lab = "TSS", y.vals = c(0, 1.4))
```

```
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01"
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01_mean"
```

```
## [1] 0.0 1.4
```

```r
plotSigLine(perm[[2]][, 2], step = 5, yval = 1.3, col = col3[1])
plotSigLine(perm[[2]][, 3], step = 5, yval = 1.25, col = col3[2])
```

![plot of chunk refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_omp_ngn_icam_rep](figure/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_omp_ngn_vs_icam_omp_ngn_icam_rep.png) 



```r
plot2.several("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_chr", 
    "cells_hmc_rep", data_type = "rpkm/mean", group2 = "trim0.01", cols = col3, 
    lab = "TSS", y.vals = c(0, 1.4))
```

```
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01"
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01_mean"
```

```
## [1] 0.0 1.4
```

```r
plotSigLine(perm[[3]][, 2], step = 5, yval = 1.3, col = col3[1])
plotSigLine(perm[[3]][, 3], step = 5, yval = 1.25, col = col3[2])
```

![plot of chunk refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_omp_ngn_icam_rep](figure/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_vs_omp_icam_omp_ngn_icam_rep.png) 




```r
plot2.several("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_chr", 
    "cells_hmc_rep", data_type = "rpkm/mean", group2 = "trim0.01", cols = col3, 
    lab = "TSS", y.vals = c(0, 1.4))
```

```
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01"
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01_mean"
```

![plot of chunk refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_omp_ngn_icam_rep](figure/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_ngn_icam_vs_omp_omp_ngn_icam_rep.png) 

```
## [1] 0.0 1.4
```




```r
plot2.several("refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_chr", 
    "cells_hmc_rep", data_type = "rpkm/mean", group2 = "trim0.01", cols = col3, 
    lab = "TSS", y.vals = c(0, 1.4))
```

```
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01"
## [1] "omp_hmc_rep1_q30_rmdup_extend300_mean_omp_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01"
## [1] "ngn_hmc_rep1_q30_rmdup_extend300_mean_ngn_hmc_rep2_q30_rmdup_trim0.01_mean"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01"
## [1] "icam_hmc_rep1_q30_rmdup_extend300_mean_icam_hmc_rep2_q30_rmdup_trim0.01_mean"
```

```
## [1] 0.0 1.4
```

```r
plotSigLine(perm[[5]][, 2], step = 5, yval = 1.3, col = col3[3])
```

![plot of chunk refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_omp_ngn_icam_rep](figure/refGene_noRandom_order_outsides2_tss_W25F200_omp_ngn_icam_mrna_ucsc_fpkm_1log2_mclust_icam_vs_omp_ngn_omp_ngn_icam_rep.png) 

