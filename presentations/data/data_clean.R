
require(tidyverse)

data1 <- read.table('data/gat_AnnotatedFeatures_anno_overlap.tsv', head = T, stringsAsFactors = F)
data2 <- read.table('data/gat_GenomicRegions_anno_overlap.tsv', head = T, stringsAsFactors = F)
data3 <- read.table('data/gat_GWASCat_anno_overlap.tsv', head = T, stringsAsFactors = F)
data4 <- read.table('data/gat_lincRNA_anno_overlap.tsv', head = T, stringsAsFactors = F)
data5 <- read.table('data/gat_smallRNA_anno_overlap.tsv', head = T, stringsAsFactors = F)

all.data <- rbind(data5, data4, data2, data1, data3)

head(all.data)

all.data <-
  all.data %>%
  select(annotation, observed, expected, fold, pvalue)

write.table(all.data, 'data/table_data.txt', row.names = F, col.names = T)


all.data <- read.table('data/table_data.txt', head = T)






var.data <- read.table('data/final_out.csv', head = T, stringsAsFactors = F)

var.data$gene <- unlist(lapply(strsplit(as.character(var.data$gene), split = ';'), `[[`, 1))
var.data$aa_sub <- unlist(lapply(strsplit(as.character(var.data$amino_acid_substitution), split = ';'), `[[`, 1))
var.data$MutationAssessor <- unlist(lapply(strsplit(as.character(var.data$MutationAssessor), split = ','), `[[`, 1))
var.data$MutationTaster <- unlist(lapply(strsplit(as.character(var.data$MutationTaster), split = ','), `[[`, 1))
var.data$CADD <- unlist(lapply(strsplit(as.character(var.data$CADD), split = ','), `[[`, 1))
var.data$CADD <- as.numeric(var.data$CADD)
var.data$variant_type <- 
  gsub('_variant', '', var.data$variant_type) %>% 
  gsub('&.*', '', .) %>% 
  gsub('_gene', '', .) %>%
  gsub('non_coding_transcript_', '', .)

var.clean <-
  var.data %>%
  select(chromosome, position, id, aa_sub, variant_type, gene, MutationTaster, CADD) 

colnames(var.clean)[1] <- 'chr' 
colnames(var.clean)[5] <- 'variant' 
colnames(var.clean)[7] <- 'MutTaster' 

write.table(var.clean, 'data/founder_variants.txt', row.names = F, col.names = T)




  