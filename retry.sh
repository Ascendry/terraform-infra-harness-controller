#!/bin/bash

# Clean up any existing state
rm -rf .terraform
rm -f .terraform.lock.hcl
rm -f terraform.tfstate
rm -f terraform.tfstate.backup
rm -rf .kube

# Create .kube directory with proper permissions
mkdir -p .kube
chmod 700 .kube

# Initialize Terraform
terraform init

# Run Terraform
terraform apply -auto-approve 