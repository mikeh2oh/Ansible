#!/bin/bash
# Safe creation of ansible user
if ! id "ansible" &>/dev/null; then
    sudo adduser --disabled-password --gecos "" ansible
    echo "ansible:ansible" | sudo chpasswd
    echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
fi

# Install Ansible properly
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

