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
conda install --file requirements/misc \
              --file requirements/python \
              --file requirements/r
