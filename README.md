# mouthwash DSC

[![Travis-CI Build Status](https://travis-ci.org/jdblischak/dsc-mouthwash.svg?branch=master)](https://travis-ci.org/jdblischak/dsc-mouthwash)
[![Binder](http://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/jdblischak/dsc-mouthwash/master)

[Dynamic Statistical Comparisons][dsc] for [MOUTHWASH simulations][mouthwash].

[dsc]: https://stephenslab.github.io/dsc-wiki/
[mouthwash]: https://github.com/dcgerard/mouthwash_sims

## Setup

The necessary computational environment must be installed on a linux-64
machine. Below are instructions for using Docker or conda.

The Docker image is based on [continuumio/miniconda3][].

```
# Build image
docker build -t dsc-mouthwash .
# Run container
docker run --rm -it dsc-mouthwash
# Run Jupyter notebook
docker run -i -t -p 8888:8888 continuumio/miniconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser --allow-root"
```

[continuumio/miniconda3]: https://hub.docker.com/r/continuumio/miniconda3/

Alternatively if you have conda installed, you can install the environment
directly on your machine. Note that if you want to build the R packages from
source in `install.R`, you'll need the common compilers g++, gcc, and gfortran
installed on your system.

```
conda create -n dsc-mouthwash \
  -c conda-forge -c bioconda -c defaults -c jdblischak \
  --file requirements/sos-conda \
  --file requirements/dsc-conda \
  --file requirements/mouthwash-conda
source activate dsc-mouthwash
pip install --no-deps \
  -r requirements/sos-pip \
  -r requirements/dsc-pip
Rscript install.R
```

## Notes

From [Section 4.1][sec4.1]:

[sec4.1]: https://academic.oup.com/biostatistics/advance-article/doi/10.1093/biostatistics/kxy029/5050477#118582529

### simulate

* $p$ (genes) - 1000
* $\pi_0$ (proportion of null genes) - 0.5, 0.9, 1
* $n$ (samples) - 6, 10, 20, 40
* $m$ (control genes) - 10, 100

Number of combinbations = 3 * 4 * 2 = 24

500 replicates of each combination, therefore 500 * 24 = 12,000 simulated datasets.

### analyze

1. OLS
1. SVA
1. CATErr
1. CATErr+MAD
1. RUV2
1. RUV3
1. CATEnc
1. CATEnc+MAD
1. CATEnc+Cal
1. MOUTHWASH
1. BACKWASH

### score

* AUC - ability to distinguish null versus non-null genes
* $\pi_0$ - estimated proportion of null genes

From [section 4.3][sec4.3]:

[sec4.3]: https://academic.oup.com/biostatistics/advance-article/doi/10.1093/biostatistics/kxy029/5050477#118582544

### simulate

* GTEx tissue (23)
* List of control genes (2)

Therefore 23 * 2 = 46 datasets.

### analyze

Same as above

### score

* $s$ - number of sex-chromosome genes in top 100 most significant results
* $\pi_0$ - estimated proportion of null genes
