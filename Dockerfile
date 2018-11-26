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

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nano

RUN conda config --add channels jdblischak && \
    conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge

RUN conda config \
  --set always_yes yes \
  --set changeps1 no \
  --set auto_update_conda False

RUN mkdir /root/dsc-mouthwash
WORKDIR /root/dsc-mouthwash
COPY requirements/ /root/dsc-mouthwash/requirements/

RUN conda install \
  --file requirements/sos-conda \
  --file requirements/dsc-conda \
  --file requirements/dscrutils-conda \
  --file requirements/mouthwash-conda

RUN pip install --no-deps \
  -r requirements/sos-pip \
  -r requirements/dsc-pip

# Install remaining R packages from source
# GitHub: dscrutils
COPY .Rprofile /root/dsc-mouthwash
COPY install.R /root/dsc-mouthwash
RUN Rscript install.R

RUN conda clean --all

COPY download-data.sh /root/dsc-mouthwash

CMD [ "/bin/bash" ]
