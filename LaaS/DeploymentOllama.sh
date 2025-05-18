#!/bin/bash

source ./access.sh

cd Ollama-Terraform
terraform init
terraform apply -auto-approve
cd ..
