FROM continuumio/miniconda3:4.5.11
# https://hub.docker.com/r/continuumio/miniconda3/
# https://github.com/ContinuumIO/docker-images/blob/miniconda3-4.3.27p0/miniconda3/Dockerfile

# Build: docker build -t dsc-mouthwash .
# Run: docker run --rm -it dsc-mouthwash
# Remove exited containers:
#   docker ps -aq --no-trunc -f status=exited | xargs docker rm
# Remove untagged images:
#   docker images -q --filter dangling=true | xargs docker rmi

MAINTAINER John Blischak, jdblischak@gmail.com

RUN conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge

RUN conda update --all --yes

# Install sos
RUN conda install -y \
  fasteners \
  jinja2 \
  nbformat \
  networkx \
  pexpect \
  psutil \
  pydot \
  pydotplus \
  pygments \
  python \
  pyyaml \
  pyzmq \
  setuptools \
  tqdm
RUN pip install --no-deps \
  sos \
  sos-bioinfo \
  sos-pbs \
  sos-rq

# Install dsc
RUN conda install -y \
  h5py \
  msgpack-python \
  numexpr \
  numpy \
  pandas >=0.23.4 \
  pyarrow >=0.5.0 \
  python >=3.6 \
  sqlalchemy \
  sympy \
  tzlocal
RUN pip install --no-deps \
  dsc \
  PTable

RUN mkdir /root/dsc-mouthwash
WORKDIR /root/dsc-mouthwash
COPY .Rprofile /root/dsc-mouthwash

# Install dsc R API
RUN conda install -y \
  r-base \
  r-devtools
RUN which Rscript > rexec.txt

# Install mouthwash Bioconductor packages
RUN conda install -y \
  bioconductor-biomart \
  bioconductor-limma \
  bioconductor-sva \
  bioconductor-qvalue

# Install mouthwash CRAN packages
RUN conda install -y \
  r-ashr \
  r-assertthat \
  r-coda \
  r-corpcor \
  r-ggthemes \
  r-irlba \
  r-proc \
  r-rcpparmadillo \
  r-rcppprogress \
  r-r.utils \
  r-reshape2 \
  r-ruv \
  r-svd \
  r-tidyverse \
  r-xtable

# Install remaining R packages from source
# CRAN: bfa, cate
# GitHub: seqgendiff, vicar
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    g++ \
    gcc \
    gfortran \
    nano
RUN conda install -y make
COPY install.R /root/dsc-mouthwash
RUN Rscript install.R

RUN conda clean -ya

CMD [ "/bin/bash" ]
