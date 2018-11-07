FROM continuumio/miniconda3:4.5.11
# https://hub.docker.com/r/continuumio/miniconda3/

MAINTAINER John Blischak, jdblischak@gmail.com

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nano

RUN mkdir /root/dsc-mouthwash
WORKDIR /root/dsc-mouthwash
COPY . /root/dsc-mouthwash

RUN conda env create --file environment.yaml
RUN conda activate dsc-mouthwash

RUN Rscript install.R

CMD ["/bin/bash"]
