#!/bin/bash

# Update system
sudo yum update -y

# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Add systemd override to bind to 0.0.0.0
sudo mkdir -p /etc/systemd/system/ollama.service.d

cat <<EOF | sudo tee /etc/systemd/system/ollama.service.d/override.conf
[Service]
Environment="OLLAMA_HOST=0.0.0.0"
EOF

# Reload systemd and enable Ollama
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable ollama
sudo systemctl start ollama

# Wait for the service to be available
for i in {1..10}; do
  if curl -s http://localhost:11434 > /dev/null; then
    echo "Ollama is up"
    break
  else
    echo "Waiting for Ollama..."
    sleep 3
  fi
done

# Pull a model with valid HOME context
sudo -u ec2-user HOME=/home/ec2-user ollama pull llama3.2