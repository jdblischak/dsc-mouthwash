#!/usr/bin/env R

# Score: Mean Squared Error
#
# Modified from original.
#
# author: David Gerard (@dcgerard)
# source: https://github.com/dcgerard/mouthwash_sims/blob/f4c80c7affcdf03ec5278554425dbbd331a0703b/Code/mouthwash_sims.R#L115

mse <- function(betahat, beta_true) {
  mean((betahat - beta_true) ^ 2, na.rm = TRUE)
}
