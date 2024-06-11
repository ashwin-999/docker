FROM ubuntu:20.04
LABEL maintainer="ashwin.kannan3@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# Run package updates and install packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget git cmake g++ gdb sudo python3.6 python3-dev python3-pip

# Upgrade pip
RUN pip3 install --upgrade pip

# Install Apache Airflow
# Define the Airflow version to install
ARG AIRFLOW_VERSION=2.7.3
# Define the default Airflow home directory
ENV AIRFLOW_HOME=/usr/local/airflow

# Install Airflow with the desired extras, e.g., postgres, celery
RUN pip3 install "apache-airflow[celery]==${AIRFLOW_VERSION}" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.7.3/constraints-3.8.txt"

# Expose default port for Airflow webserver
EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
