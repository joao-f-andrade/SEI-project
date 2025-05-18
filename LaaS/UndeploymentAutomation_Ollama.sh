#!/bin/bash

source ./access.sh


#Terraform - Ollama
cd Ollama-Terraform
terraform destroy -auto-approve
cd ..

