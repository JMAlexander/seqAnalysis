source("~/src/R/AnnoSet/AnnoSetSimp.initialize.R")
source("~/src/R/AnnoSet/AnnoSetSimp.getPositions.R")
source("~/src/R/AnnoSet/AnnoSetSimp.couplingVector.R")
source("~/src/R/AnnoSet/AnnoSet.readAlignedSequences.R")
#source("~/src/R/AnnoSet/AnnoSetSimp.calibrationCurve.R")
source("~/src/R/AnnoSet/AnnoSet.normalize.R")
source("~/src/R/AnnoSet/AnnoSetSimp.profiles.R")
source("~/src/R/LEA/medips.R")

library(foreach)
library(multicore)
library(doMC)

options(scipen=999)
registerDoMC(cores=12)

setClass(Class = 'AnnoSetSimp',
         representation = representation(
           name='character',
           set_chr='character',
           set_pos='numeric',
           set_names='character',
           set_group='numeric',
           set_strand='character',
           #anno_data='big.matrix',
           chr_names='character',
           chr_lengths='numeric',
           bin_size='numeric',
           genome_name='character',
           coupling_vector ='CouplingVector',         # CouplingVector
           read_data='list',                 # ReadSet
           pattern_data='PatternSet',             # PatternSet
           intercept='numeric',
           slope='numeric'
          #norm_data='NormalizationFeatures'
           ),
         prototype = prototype(
           #coupling_vector=NULL,
           #pattern_data=NULL,
           #norm_data=NULL
             ),
         validity = function(object){
           if(FALSE) stop("")
           return(TRUE)
         }
         #contains = "Object"
         )

setClass(Class = "ReadSet",
         representation = representation(
           name='character',
           raw='numeric',
           #rpm='numeric',
           rms='numeric',
           ams='numeric',
           number_regions='numeric'
 #          intercept='numeric'
 #          slope='numeric'
           ),
         prototype = prototype()
         #contains = "Object"
         )


setClass(Class = "NormalizationFeatures",
         representation = representation(
           #calcurve_mean_signals='numeric',
           #calcurve_mean_couplings='numeric',
           #calcurve_var='numeric',
           intercept='numeric',
           slope='numeric',
           cali_chr='character'
           ),
         prototype = prototype()
         #contains = "Object"
         )

setClass(Class = "PatternSet",
         representation = representation(
           pattern='character',
           pattern_chr='character',
           pattern_pos='numeric'
           #coupling_vectors='list'   #CouplingVector
           ),
         prototype = prototype()
         #contains = "Object"
         )

setClass(Class = "CouplingVector",
         representation = representation(
           setCoup='numeric',
           fragmentLength='numeric',
           distFunction='character'
           ),
         prototype = prototype()
         #contains = "Object"
         )

createAnnoSet <- function(annotation) {
  a <- AnnoSet.initialize(annotation, 100, BSgenome="BSgenome.Mmusculus.UCSC.mm9")
  a <- AnnoSet.getPositions(a, pattern="CG")
  a <- AnnoSet.couplingVector(a)
  return(a)
}

createAnnoSetSimp <- function(annotation, reads) {
  anno_path <- paste("~/lib/annotations", annotation, sep="/")
  a <- AnnoSetSimp.initialize(anno_path, BSgenome="BSgenome.Mmusculus.UCSC.mm9")
  a <- AnnoSetSimp.getPositions(a, pattern="CG")
  a <- AnnoSetSimp.couplingVector(a)
  a <- AnnoSet.readAlignedSequences(a, reads)
  a <- AnnoSetSimp.normalize(a, reads)
  return(a) 
}

cells <- paste(rep(c("omp", "ngn", "icam"), each=2), c("hmedip.bed", "medip.bed"), sep="_")

createAnnoSetSimpComplete <- function(annotation, set) {
  anno_path <- paste("~/lib/annotations", annotation, sep="/")
  a <- AnnoSetSimp.initialize(anno_path, BSgenome="BSgenome.Mmusculus.UCSC.mm9")
  a <- AnnoSetSimp.getPositions(a, pattern="CG")
  a <- AnnoSetSimp.couplingVector(a)
  for (reads in set) {
    a <- AnnoSet.readAlignedSequences(a, reads)
    a <- AnnoSetSimp.normalize(a, reads)
  }  
  return(a) 
}

renormalizeAllReads <- function(data, transf) {
  read_names <- .getNames(data@read_data)
  for(reads in read_names) {
    data <- AnnoSetSimp.normalize(data, reads, transf)
  }
  return(data)
}

addAndNormReads <- function(data, reads, transf) {
  a <- AnnoSet.readAlignedSequences(data, reads)
  a <- AnnoSetSimp.normalize(a, reads)
  return(a)
}

removeAllReadDataAndReplace <- function(data, reads) {
  data@read_data <- list()
  a <- AnnoSet.readAlignedSequences(data, reads)
  a <- AnnoSetSimp.normalize(a, reads)
  return(a)
}

getDataByType <- function(read_data, data_type) {
  out <- NULL
  if (data_type == "raw") {out <- read_data@raw}
  if (data_type == "norm") {out <- read_data@norm}
  if (data_type == "rms") {out <- read_data@rms}
  if (data_type == "ams") {out <- read_data@ams}
  return(out)
}

saveAnnoSet <- function(annoset) {
  data_path <- "~/data/annoset"
  fname <- .nameSplit(annoset)
  save(annoset, file=paste(data_path, fname, sep="/"))
}

loadAnnoSet <- function(annoset) {
  data_path <- "~/data/annoset"
  load(paste(data_path, annoset, sep="/"))
}

exportAnnoInfo <- function(annoset=NULL, fpath=NULL) {
  chr <- annoset@set_chr
  start <- annoset@set_pos
  end <- start + annoset@bin_size - 1
  name <- annoset@set_names
  group <- annoset@set_group
  strand <- annoset@set_strand
  out <- cbind(chr, as.numeric(start), as.numeric(end), name, group, strand)
  write.table(format(out, scientific=FALSE, justify="none"), file=fpath, quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
}

updateCalInfo <- function(annoset, info) {
  annoset@intercept <- info[1]
  annoset@slope <- info[2]
  return(annoset)
}

.nameSplit <- function(annoset) {
  name <- unlist(strsplit(annoset@name, "/"))
  name <- name[length(name)]
  return(name)
}

.find <- function(set, name) {
  index <- 0
  for(i in 1:length(set)) {
    if (set[[i]]@name == name) {
      index <- i
      break
    }
  }
  return(index)  
}

.extract <- function(set, name) {
  return(set[[.find(set, name)]])
}

.replace <- function(set, name, replacement) {
  index <- .find(set, name)
  set[index] <- replacement
  return(set)
}

.getNames <- function(read_set) {
  names <- lapply(read_set, function(x) return(x@name))
  return(names)
}

.selectFiles <- function(files, select) {
  out <- files[grep(select, files)]
  return(out)
}
addDataSet <- function(AnnoSet, dataset_name, vals) {
  DataSetObj <- new('DataSet', sample = dataset_name, raw = vals)
  AnnoSet@seq_data <- c(AnnoSet@seq_data, DataSetObj)
  return(AnnoSet)
}


