#!/bin/bash
set -eux

# Install GitHub R packages from source

for pkg in seqgendiff vicar
do
  wget -O /tmp/${pkg}.zip https://github.com/dcgerard/${pkg}/archive/master.zip
  unzip /tmp/${pkg}.zip -d /tmp/
  R CMD build --no-build-vignettes --no-manual /tmp/${pkg}-master
  mv ${pkg}_*.tar.gz /tmp/
  R CMD INSTALL /tmp/${pkg}_*.tar.gz
  rm -r /tmp/${pkg}*
done

# Install dscrutils from subdirectory

wget -O /tmp/dsc.zip https://github.com/stephenslab/dsc/archive/master.zip
unzip /tmp/dsc.zip -d /tmp/
R CMD build --no-build-vignettes --no-manual /tmp/dsc-master/dscrutils/
mv dscrutils_*.tar.gz /tmp/
R CMD INSTALL /tmp/dscrutils_*.tar.gz
rm -r /tmp/dsc*
