# Use an official base image with Docker support
FROM ubuntu:22.04

# Set environment variables to reduce interactions during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies including snap
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    gnupg \
    sudo \
    apt-transport-https \
    software-properties-common \
    snapd \
    && rm -rf /var/lib/apt/lists/*

# Set up snap
RUN systemctl enable snapd

# Install Ollama using snap
RUN snap install core && snap install ollama

# Expose the default port for Ollama
EXPOSE 11434

# Set the working directory
WORKDIR /root

# Start Ollama and run the model
CMD ["sh", "-c", "ollama serve & sleep 5 && ollama run CognitiveComputations/dolphin-llama3.1:8b"]