#!/bin/bash

set -e

# Add the Ansible PPA
sudo apt-add-repository -y ppa:ansible/ansible

# Update the package list
sudo apt-get update

# Install Ansible and pipx
sudo apt-get install -y ansible pipx

# Ensure pipx bin directory is on PATH
pipx ensurepath

# Install Ansible required collections
ansible-galaxy collection install -r requirements.yml

# Install Ansible Lint
pipx install ansible-lint

echo "Ansible has been installed successfully!"
