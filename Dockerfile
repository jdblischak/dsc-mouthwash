FROM continuumio/miniconda3:latest
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

RUN mkdir /root/dsc-mouthwash

WORKDIR /root/dsc-mouthwash

COPY requirements/ /root/dsc-mouthwash/requirements/

COPY install.sh /root/dsc-mouthwash/

COPY code/ /root/dsc-mouthwash/code/

COPY data/gtex-muscle-subset.csv /root/dsc-mouthwash/data/

COPY mouthwash.dsc /root/dsc-mouthwash

COPY download-data.sh /root/dsc-mouthwash

RUN bash install.sh

RUN conda clean --all

CMD [ "/bin/bash" ]
