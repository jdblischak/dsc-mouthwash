#!/bin/bash
set -eux

# Configure conda
conda config --set always_yes yes
conda config --set changeps1 no
conda config --add channels jdblischak
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda update -q conda
conda info -a

# Install conda packages
conda install --file misc --file python --file r

# Install dscrutils from GitHub repo subdirectory
wget -O /tmp/dsc.zip https://github.com/stephenslab/dsc/archive/master.zip
unzip /tmp/dsc.zip -d /tmp/
R CMD build --no-build-vignettes --no-manual /tmp/dsc-master/dscrutils/
mv dscrutils_*.tar.gz /tmp/
R CMD INSTALL /tmp/dscrutils_*.tar.gz
rm -r /tmp/dsc*
