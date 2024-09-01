# Use an official base image with Docker support
FROM ubuntu:22.04

# Set environment variables to reduce interactions during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    gnupg \
    sudo \
    apt-transport-https \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Expose the default port for Ollama
EXPOSE 11434

# Create a directory for Ollama data
RUN mkdir -p /root/.ollama

# Set the working directory
WORKDIR /root

# Run the CognitiveComputations/dolphin-llama3.1:8b model
CMD ["ollama", "run", "CognitiveComputations/dolphin-llama3.1:8b"]