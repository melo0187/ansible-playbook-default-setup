#!/bin/bash

set -e

install_linux() {
    # Add the Ansible PPA
    sudo apt-add-repository -y ppa:ansible/ansible

    # Update the package list
    sudo apt-get update

    # Install Ansible and pipx
    sudo apt-get install -y ansible pipx

    # Ensure pipx bin directory is on PATH
    pipx ensurepath

    # Install Ansible Lint
    pipx install ansible-lint
}

install_macos() {
    # Install Homebrew if not present
    if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Install Ansible and Ansible Lint
    brew install ansible ansible-lint
}

# Detect OS and install accordingly
case "$(uname -s)" in
    Linux)
        install_linux
        ;;
    Darwin)
        install_macos
        ;;
    *)
        echo "Unsupported operating system: $(uname -s)"
        exit 1
        ;;
esac

# Install Ansible required collections
ansible-galaxy collection install -r requirements.yml

echo "Ansible has been installed successfully!"
