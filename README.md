# mouthwash DSC

[![Binder](http://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/jdblischak/dsc-mouthwash/master)

[Dynamic Statistical Comparisons][dsc] for [MOUTHWASH simulations][mouthwash].

[dsc]: https://stephenslab.github.io/dsc-wiki/
[mouthwash]: https://github.com/dcgerard/mouthwash_sims

## Setup

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
directly on your machine.

```
conda env create --file environment.yaml
source activate dsc-mouthwash
Rscript install.R
```
