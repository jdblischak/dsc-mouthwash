#!/usr/bin/env R

# Analyze: Ordinary Least Squares regression
#
# author: David Gerard (@dcgerard)
# source: https://github.com/dcgerard/mouthwash_sims/blob/f4c80c7affcdf03ec5278554425dbbd331a0703b/Code/nc_adjustment_methods.R#L26

## Basic OLS -----------------------------------------------------------------
ols <- function(Y, X, quant = 0.95) {
  limma_out <- limma::lmFit(object = t(Y), design = X)
  betahat   <- limma_out$coefficients[, 2]
  sebetahat <- limma_out$stdev.unscaled[, 2] * limma_out$sigma
  df        <- limma_out$df.residual[1]
  return(list(betahat = betahat, sebetahat = sebetahat, df = df))
}
