#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Add the Ansible PPA
sudo apt-add-repository -y ppa:ansible/ansible

# Update the package list
sudo apt-get update

# Install Ansible
sudo apt-get install -y ansible

echo "Ansible has been installed successfully!"
