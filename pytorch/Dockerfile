# Use the official PyTorch image as a parent image
FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-runtime

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY train.py .

# Command to run on container start
CMD ["python", "./train.py"]
