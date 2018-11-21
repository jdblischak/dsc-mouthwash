#!/usr/bin/env dsc

generate_data: generate_data.R + R(d = generate_data(csv, Ngene, nullpi, Nsamp, ncontrol))
  csv: "data/gtex/muscle.csv"
  Ngene: 1000
  nullpi: 0.5, 0.9, 1
  Nsamp: 6, 10, 20, 40
  ncontrol: 10, 100
  $X: d$X
  $Y: d$Y
  $beta_true: d$beta_true

ols: ols.R + R(d = ols(Y, X))
  X: $X
  Y: $Y
  $betahat: d$betahat
  $sebetahat: d$sebetahat
  $df: d$df

mse: mse.R + R(d = mse(betahat, beta_true))
  betahat: $betahat
  beta_true: $beta_true
  $mse: d

DSC:
  define:
    simulate: generate_data
    analyze: ols
    score: mse
  run: simulate * analyze * score
  exec_path: code
