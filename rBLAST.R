setwd("/home/chadwick/Documents/C3VIP/taxonomyBLAST")
#if (!require("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install(version = "3.14")
#BiocManager::install("Biostrings")
library(Biostrings)
#install.packages('rBLAST', repos = 'https://mhahsler.r-universe.dev')
library(rBLAST)
#download.file("https://ftp.ncbi.nlm.nih.gov/blast/db/ITS_RefSeq_Fungi.tar.gz",
#                "ITS_RefSeq_Fungi.tar.gz", mode='wb')
bl = blast(db = "./ITS_RefSeq_Fungi/ITS_RefSeq_Fungi", type = "blastn")
bl
print(bl, info=TRUE)

SEQ_NAMES <- read.csv("DryCreek_ITS_ASVs.csv", header = FALSE)
SEQ_NAMES <- gsub(pattern = ">", x = SEQ_NAMES[,1], replacement = paste(">","ITS",sep=""))
SEQ_NAMES <- data.frame(SEQ_NAMES)
write.csv(SEQ_NAMES, "DryCreek_ITS_ASVs_mod.csv")

seq <- readDNAStringSet("DryCreek_ITS_ASVs_mod.csv")     

cl <- predict(bl, seq[1,])
cl[1:5,]

read.table(bl$db, sep = ",", quote = "")
