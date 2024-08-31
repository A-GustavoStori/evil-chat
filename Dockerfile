# Dockerfile for Ollama

# Use an official base image with Docker support
FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && \
    apt-get install -y nodejs

# Install Docker
RUN apt-get install -y docker.io

# Install Ollama
RUN curl -sSL https://ollama.com/install.sh | sh

# Expose the default port for Ollama (e.g., 11434)
EXPOSE 11434

# Start the Docker service and Ollama
CMD service docker start && ollama pull CognitiveComputations/dolphin-llama3.1 && ollama run CognitiveComputations/dolphin-llama3.1 --serve
