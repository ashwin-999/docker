# Use the official MLflow image as the base image
FROM ghcr.io/mlflow/mlflow

# Install PostgreSQL drivers
RUN pip install psycopg2-binary

# Set the working directory
WORKDIR /mlflow/

# Expose the required ports
EXPOSE 5000
