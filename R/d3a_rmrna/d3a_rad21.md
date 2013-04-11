D3a Rad21 sites
========================================================


```r
suppressPackageStartupMessages(source("~/src/seqAnalysis/R/profiles2.R"))
opts_chunk$set(warning = FALSE, message = FALSE, error = FALSE, results = "hide")
```


#### Random sample of Rad21 sites

```r
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_nosex.bed_W25F200_both_chr", 
    data_type = "bam_extend/mean_chrom_mean_0", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_nosex.bed_W25F200_both_chr", 
    data_type = "bam_ends/mean", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_nosex.bed_W25F200_both_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```


#### Random sample of Rad21 sites, 100kb view

```r
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", 
    data_type = "bam_extend/mean_chrom_mean_0", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", 
    data_type = "bam_extend/mean_chrom_mean", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", 
    data_type = "bam_ends/mean", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```


#### Rad21 sites, no CTCF, 50 kb view

```r
makeProfile2.allSamp("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex.bed_W200F250_both_chr", 
    data_type = "bam_extend/mean_chrom_mean_0", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex.bed_W200F250_both_chr", 
    data_type = "bam_ends/mean", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex.bed_W200F250_both_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```



```r
makeProfile2.allSamp("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex_sub_d3a_het_dnase_sort_q30_dnase.bed_W200F250_both_chr", 
    data_type = "bam_extend/mean_chrom_mean_0", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex_sub_d3a_het_dnase_sort_q30_dnase.bed_W200F250_both_chr", 
    data_type = "bam_extend/mean", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex_sub_d3a_het_dnase_sort_q30_dnase.bed_W200F250_both_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```


#### CTCF sites, no Rad21

```r
makeProfile2.allSamp("cad_n2a_ctcf_r12_sub_cad_n2a_rad21_r12_nosex.bed_W200F250_both_chr", 
    data_type = "bam_extend/mean_chrom_mean_0", rm.outliers = 0.01)
#
# makeProfile2.allSamp('cad_n2a_ctcf_r12_sub_cad_n2a_rad21_r12_nosex.bed_W200F250_both_chr',
# data_type='bam_extend/mean', rm.outliers=0.01)
makeProfile2.allSamp("cad_n2a_ctcf_r12_sub_cad_n2a_rad21_r12_nosex.bed_W200F250_both_chr", 
    data_type = "bam_ends/mean", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_ctcf_r12_sub_cad_n2a_rad21_r12_nosex.bed_W200F250_both_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```


#### Random sample of Rad21 sites, position randomized

```r
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr", 
    data_type = "bam_extend/mean_chrom_mean_0", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr", 
    data_type = "bam_ends/mean", rm.outliers = 0.01)
makeProfile2.allSamp("cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr", 
    data_type = "rpkm/mean", rm.outliers = 0.01)
```


### 5hmC
#### Rad21, random sample and randomized positions

```r
par(mfrow = c(1, 2), mar = c(2, 2, 2, 2))
plot2.several("cad_n2a_rad21_r12_rand10E4_nosex.bed_W25F200_both_chr", "d3a_hmc", 
    data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0.2, 
        1))
plot2.several("cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr", 
    "d3a_hmc", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0.2, 
        1))
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 


#### Rad21, random sample 100 kb view

```r
par(mfrow = c(1, 1), mar = c(2, 2, 2, 2))
plot2.several("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", "d3a_hmc", 
    data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0.2, 
        1), range = c(251, 750))
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 

```r
#
# plot2.several('cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr',
# 'd3a_hmc', data_type='rpkm/mean', group2='trim0.01', cols=col2,
# y.vals=c(.2, 1))
```


#### Rad21 sites, no CTCF, 50 kb view

```r
plot2.several("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex.bed_W200F250_both_chr", 
    "d3a_hmc", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0.2, 
        1), baseline = T, wsize = 200)
```

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10.png) 


#### Rad21 sites, no CTCF/DNase, 50 kb view

```r
plot2.several("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex_sub_d3a_het_dnase_sort_q30_dnase.bed_W200F250_both_chr", 
    "d3a_hmc", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0.2, 
        1), baseline = T, wsize = 200)
```

![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 


#### CTCF sites, no Rad21

```r
plot2.several("cad_n2a_ctcf_r12_sub_cad_n2a_rad21_r12_nosex.bed_W200F250_both_chr", 
    "d3a_hmc", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0.2, 
        1), baseline = F, wsize = 200)
```

![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-12.png) 


### 5mC
#### Rad21, random sample and randomized positions

```r
par(mfrow = c(1, 2), mar = c(2, 2, 2, 2))
plot2.several("cad_n2a_rad21_r12_rand10E4_nosex.bed_W25F200_both_chr", "d3a_mc", 
    data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0, 
        0.6))
plot2.several("cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr", 
    "d3a_mc", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0, 
        0.6))
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13.png) 


#### Rad21, random sample 100 kb view

```r
par(mfrow = c(1, 1), mar = c(2, 2, 2, 2))
plot2.several("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", "d3a_mc", 
    data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0, 
        0.6), range = c(251, 750), wsize = 200)
```

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14.png) 

```r
#
# plot2.several('cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr',
# 'd3a_mc', data_type='rpkm/mean', group2='trim0.01', cols=col2,
# y.vals=c(0, .6))
```


#### Rad21 sites, no CTCF, 50 kb view

```r
plot2.several("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex.bed_W200F250_both_chr", 
    "d3a_mc", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0, 
        0.6), wsize = 200)
```

![plot of chunk unnamed-chunk-15](figure/unnamed-chunk-15.png) 


#### Rad21 sites, no CTCF/DNase, 50 kb view

```r
plot2.several("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex_sub_d3a_het_dnase_sort_q30_dnase.bed_W200F250_both_chr", 
    "d3a_mc", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0, 
        0.6), wsize = 200)
```

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-16.png) 


#### CTCF sites, no Rad21

```r
plot2.several("cad_n2a_ctcf_r12_sub_cad_n2a_rad21_r12_nosex.bed_W200F250_both_chr", 
    "d3a_mc", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, y.vals = c(0.2, 
        1), baseline = F, wsize = 200)
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-17.png) 


### Nucleosomes
#### Rad21, random sample and randomized positions, mean chrom mean 0

```r
par(mfrow = c(1, 2), mar = c(2, 2, 2, 2))
plot2.several("cad_n2a_rad21_r12_rand10E4_nosex.bed_W25F200_both_chr", "d3a_nuc_extend", 
    data_type = "bam_extend/mean_chrom_mean_0", group2 = "trim0.01", cols = col2, 
    y.vals = c(0.8, 1.3), baseline = F)
plot2.several("cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr", 
    "d3a_nuc_extend", data_type = "bam_extend/mean_chrom_mean_0", group2 = "trim0.01", 
    cols = col2, y.vals = c(0.8, 1.3), baseline = F)
```

![plot of chunk unnamed-chunk-18](figure/unnamed-chunk-18.png) 


#### Rad21, random sample 100 kb view, mean chrom mean 0

```r
par(mfrow = c(1, 1), mar = c(2, 2, 2, 2))
plot2.several("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", "d3a_nuc_extend", 
    data_type = "bam_extend/mean_chrom_mean_0", group2 = "trim0.01", cols = col2, 
    y.vals = c(0.8, 1.3), baseline = F, wsize = 200, range = c(251, 750))
```

![plot of chunk unnamed-chunk-19](figure/unnamed-chunk-19.png) 

```r
#
# plot2.several('cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr','d3a_nuc_extend',
# data_type='bam_extend/mean_chrom_mean_0', group2='trim0.01', cols=col2,
# y.vals=c(.8, 1.3), baseline=F)
```


#### Rad21, random sample 100 kb view, mean chrom mean 

```r
plot2.several("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", "d3a_nuc_extend", 
    data_type = "bam_extend/mean_chrom_mean", group2 = "trim0.01", cols = col2, 
    y.vals = c(0.8, 1.3), baseline = F, wsize = 200, range = c(401, 600))
abline(h = 1, lty = 2)
```

![plot of chunk unnamed-chunk-20](figure/unnamed-chunk-20.png) 


#### Rad21, RPKM - midpoints

```r
par(mfrow = c(1, 2))
#
# plot2.several('cad_n2a_rad21_r12_rand10E4_nosex.bed_W25F200_both_chr','d3a_nuc2',
# data_type='rpkm/mean', group2='trim0.01', cols=col2, baseline=F,
# y.vals=c(0, .5))
plot2.several("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", "d3a_nuc2", 
    data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, baseline = T, 
    wsize = 200)
plot2.several("cad_n2a_rad21_r12_rand10E4_shuffle_nosex.bed_W25F200_both_chr", 
    "d3a_nuc2", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, baseline = T, 
    y.vals = c(0, 0.5))
```

![plot of chunk unnamed-chunk-21](figure/unnamed-chunk-21.png) 


#### Rad21 sites, no CTCF, 50 kb view, mean chrom mean 0

```r
par(mfrow = c(1, 1))
plot2.several("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex.bed_W200F250_both_chr", 
    "d3a_nuc_extend", data_type = "bam_extend/mean_chrom_mean_0", group2 = "trim0.01", 
    cols = col2, y.vals = c(1, 1.4), baseline = T, wsize = 200, range = c(201, 
        300))
```

![plot of chunk unnamed-chunk-22](figure/unnamed-chunk-221.png) 

```r
par(mfrow = c(1, 1))
plot2.several("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex.bed_W200F250_both_chr", 
    "d3a_nuc2", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, baseline = F, 
    wsize = 200)
```

![plot of chunk unnamed-chunk-22](figure/unnamed-chunk-222.png) 


#### Rad21 sites, no CTCF/DNase, 50 kb view, mean chrom mean 0

```r
par(mfrow = c(1, 1))
plot2.several("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex_sub_d3a_het_dnase_sort_q30_dnase.bed_W200F250_both_chr", 
    "d3a_nuc_extend", data_type = "bam_extend/mean_chrom_mean_0", group2 = "trim0.01", 
    cols = col2, y.vals = c(1, 1.4), baseline = T, wsize = 200, range = c(201, 
        300))
```

![plot of chunk unnamed-chunk-23](figure/unnamed-chunk-231.png) 

```r
plot2.several("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex_sub_d3a_het_dnase_sort_q30_dnase.bed_W200F250_both_chr", 
    "d3a_nuc_extend_sub", data_type = "bam_extend/mean", group2 = "trim0.01", 
    cols = col2, baseline = F, wsize = 200, range = c(201, 300))
```

![plot of chunk unnamed-chunk-23](figure/unnamed-chunk-232.png) 

```r
plot2.several("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex_sub_d3a_het_dnase_sort_q30_dnase.bed_W200F250_both_chr", 
    "d3a_nuc2", data_type = "rpkm/mean", group2 = "trim0.01", cols = col2, baseline = F, 
    wsize = 200)
```

![plot of chunk unnamed-chunk-23](figure/unnamed-chunk-233.png) 


#### CTCF sites, no Rad21

```r
plot2.several("cad_n2a_ctcf_r12_sub_cad_n2a_rad21_r12_nosex.bed_W200F250_both_chr", 
    "d3a_nuc_extend", data_type = "bam_extend/mean_chrom_mean_0", group2 = "trim0.01", 
    cols = col2, y.vals = c(1, 1.4), baseline = T, wsize = 200, range = c(201, 
        300))
```

![plot of chunk unnamed-chunk-24](figure/unnamed-chunk-24.png) 


### DNase

#### Rad21, random sample 100 kb view

```r
plot2("cad_n2a_rad21_r12_rand10E4_nosex.bed_W200F500_both_chr", "d3a_het_dnase_sort_q30", 
    data_type = "bam_ends/mean", group2 = "trim0.01", wsize = 200)
```

![plot of chunk unnamed-chunk-25](figure/unnamed-chunk-25.png) 


#### Rad21 sites, no CTCF, 50 kb view

```r
plot2("cad_n2a_rad21_r12_sub_cad_n2a_ctcf_r12_nosex.bed_W200F250_both_chr", 
    "d3a_het_dnase_sort_q30", data_type = "bam_ends/mean", group2 = "trim0.01", 
    wsize = 200)
```

![plot of chunk unnamed-chunk-26](figure/unnamed-chunk-26.png) 


#### CTCF sites, no Rad21

```r
plot2("cad_n2a_ctcf_r12_sub_cad_n2a_rad21_r12_nosex.bed_W200F250_both_chr", 
    "d3a_het_dnase_sort_q30", data_type = "bam_ends/mean", group2 = "trim0.01", 
    wsize = 200)
```

![plot of chunk unnamed-chunk-27](figure/unnamed-chunk-27.png) 

