FROM gaow/dsc:latest
# https://github.com/gaow/misc/blob/master/docker/dsc.dockerfile

MAINTAINER John Blischak, jdblischak@gmail.com

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git

# Default command
CMD ["bash"]
