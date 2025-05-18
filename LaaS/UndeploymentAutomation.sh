#!/bin/bash


source ./access.sh

# #Terraform - Quarkus purchase
cd Quarkus-Terraform/Purchase
terraform destroy -auto-approve
cd ../..

# #Terraform - Quarkus customer
cd Quarkus-Terraform/customer
terraform destroy -auto-approve
cd ../..

# #Terraform - Quarkus shop
cd Quarkus-Terraform/shop
terraform destroy -auto-approve
cd ../..

# #Terraform - Quarkus loyaltycard
cd Quarkus-Terraform/loyaltycard
terraform destroy -auto-approve
cd ../..

# #Terraform - RDS
cd RDS-Terraform
terraform destroy -auto-approve
cd ..

# #Terraform - Camunda
#cd Camunda-Terraform
3terraform destroy -auto-approve
#cd ..

# # #Terraform - Kafka
cd Kafka
terraform destroy -auto-approve
cd ..

# # #Terraform - Kong
#cd KongTerraform
#terraform destroy -auto-approve
#cd ..

# # #Terraform - Konga
#cd KongaTerraform
#terraform destroy -auto-approve
#cd ..

# #Terraform - Ollama
cd Ollama-Terraform
terraform destroy -auto-approve
cd ..

#Terraform - CrossSelling
cd Quarkus-Terraform/crossselling
terraform destroy -auto-approve
cd ..