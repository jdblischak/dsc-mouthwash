FROM gaow/dsc:latest
# https://github.com/gaow/misc/blob/master/docker/dsc.dockerfile

MAINTAINER John Blischak, jdblischak@gmail.com

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git

COPY . /tmp

RUN Rscript install.R

# Inherited default behavior:
# - runs bash
# - starts in /tmp
