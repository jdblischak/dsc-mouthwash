#!/bin/bash
set -eux

# Install dscrutils from GitHub repo subdirectory

wget -O /tmp/dsc.zip https://github.com/stephenslab/dsc/archive/master.zip
unzip /tmp/dsc.zip -d /tmp/
R CMD build --no-build-vignettes --no-manual /tmp/dsc-master/dscrutils/
mv dscrutils_*.tar.gz /tmp/
R CMD INSTALL /tmp/dscrutils_*.tar.gz
rm -r /tmp/dsc*
