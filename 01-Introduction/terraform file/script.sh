#!/bin/bash

# 1. Create ansible user if not exists
if ! id "ansible" &>/dev/null; then
    sudo adduser --disabled-password --gecos "" ansible
    echo "ansible:ansible" | sudo chpasswd
    echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
fi

# 2. Ensure .ssh directory and copy keys
sudo mkdir -p /home/ansible/.ssh

if [ -f /home/ubuntu/.ssh/authorized_keys ]; then
    sudo cp /home/ubuntu/.ssh/authorized_keys /home/ansible/.ssh/
fi

# 3. Set proper permissions
sudo chown -R ansible:ansible /home/ansible/.ssh

# 4. Ensure /etc/ansible exists and is owned correctly
sudo mkdir -p /etc/ansible
sudo chown -R ansible:ansible /etc/ansible
