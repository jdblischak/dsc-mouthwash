FROM continuumio/miniconda3:4.3.27p0
# https://hub.docker.com/r/continuumio/miniconda3/
# https://github.com/ContinuumIO/docker-images/blob/miniconda3-4.3.27p0/miniconda3/Dockerfile

# Build: docker build -t dsc-mouthwash .
# Run: docker run --rm -it dsc-mouthwash

MAINTAINER John Blischak, jdblischak@gmail.com

# Specify BASH shell in order to use `source` to activate the conda environment
# below
SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nano

RUN mkdir /root/dsc-mouthwash
WORKDIR /root/dsc-mouthwash
COPY . /root/dsc-mouthwash


RUN conda env create --file environment.yaml
RUN source activate dsc-mouthwash

RUN Rscript install.R

# Activte the environment when the user starts a new container
RUN echo "source activate dsc-mouthwash" >> ~/.bashrc
CMD [ "/bin/bash" ]
