# Use a specific version of Ubuntu image for stability
FROM ubuntu:22.04

# Update and install required packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Install JupyterLab
RUN pip3 install jupyterlab

# Expose port 8080 for JupyterLab
EXPOSE 8080

# Start JupyterLab on port 8080 without authentication
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8080", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
