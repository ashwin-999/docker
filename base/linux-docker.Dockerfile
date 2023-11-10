FROM ubuntu:latest
LABEL maintainer="ashwin.kannan3@gmail.com"

# RUN apt-get update && apt-get upgrade -y
# Run package updates and install packages
RUN apt-get update \
    && apt-get -y install build-essential libssl-dev libffi-dev \
    && apt-get -y install libxml2-dev libxslt1-dev zlib1g-dev

RUN apt-get install -y wget

RUN apt-get install -y git
RUN apt-get install -y cmake
RUN apt-get install -y g++
RUN apt-get install -y gdb
RUN apt-get install -y sudo
RUN apt-get install -y python3.6
RUN apt-get install -y python3-dev
# RUN apt-get install -y python3-dbg
# RUN apt-get install -y python3-pip

# Upgrade pip
# RUN pip3 install --upgrade pip

# # apt-get boost 
# RUN apt-get install -y libboost-all-dev

# Boost from source
# Download and unzip Boost
RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.83.0/source/boost_1_83_0.tar.bz2 \
    && tar --bzip2 -xf boost_1_83_0.tar.bz2

# Build Boost.Python
WORKDIR boost_1_83_0
RUN ./bootstrap.sh --with-libraries=python --with-python=/usr/bin/python3 \
    && ./b2 install


# Install Jupyter
# RUN pip3 install jupyter

EXPOSE 8888
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
