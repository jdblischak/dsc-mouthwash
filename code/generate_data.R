#!/usr/bin/env dsc

# Simulate:

generate_data <- function(nullpi, Nsamp, ncontrol) {
  # Constants
  log2foldsd <- 0.8
  Ngene <- 1000
  skip_gene <- 0

  csv <- "data/gtex-muscle-subset.csv"
  mat <- as.matrix(read.table(csv, sep = ",", row.names = 1))
  stopifnot(ncol(mat) == Ngene)

  d_out <- seqgendiff::poisthin(mat = mat,
                                nsamp = Nsamp,
                                ngene = Ngene,
                                skip_gene = skip_gene,
                                signal_params = list(mean = 0, sd = log2foldsd),
                                gvec = rep(TRUE, length(Ngene)),
                                gselect = "custom",
                                prop_null = nullpi,
                                alpha = 0)

  which_null <- abs(d_out$beta) < 10 ^ -6
  nnull         <- sum(which_null)
  control_genes <- which_null
  control_genes[control_genes][sample(1:nnull, size = nnull - ncontrol)] <- FALSE

  beta_true <- d_out$beta

  X <- d_out$X
  colnames(X) <- c("Intercept", "Treatment")
  Y <- log2(d_out$Y + 1)

  return(list(X = X, Y = Y, beta_true = beta_true))
}
