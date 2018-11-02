source("https://bioconductor.org/biocLite.R")
biocLite(c("sva", "limma", "qvalue", "biomaRt"), suppressUpdates = TRUE)
install.packages(c("tidyverse", "stringr", "reshape2", "pROC",
                   "ruv", "cate", "devtools", "ashr", "bfa",
                   "xtable", "dplyr", "ggthemes",
                   "assertthat", "R.utils"))
devtools::install_github("dcgerard/seqgendiff")
devtools::install_github("dcgerard/vicar")
