FROM ubuntu:20.04
LABEL maintainer="ashwin.kannan3@gmail.com"
# Disable interactive installs
ARG DEBIAN_FRONTEND=noninteractive

# Run package updates and install packages
RUN apt-get update \
    && apt-get -y install build-essential libssl-dev libffi-dev \
    libxml2-dev libxslt1-dev zlib1g-dev wget git cmake g++ gdb sudo \
    python3.8 python3.8-dev

# Download and unzip Boost
RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.75.0/source/boost_1_75_0.tar.bz2 \
    && tar --bzip2 -xf boost_1_75_0.tar.bz2

# Build Boost.Python
WORKDIR boost_1_75_0
RUN ./bootstrap.sh --with-libraries=python --with-python=/usr/bin/python3.8 \
    && ./b2 install

EXPOSE 8888
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
