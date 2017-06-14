#!/bin/bash
# Install prerequisites
sudo pip install paramiko edcsa
#
# Install Ansible from Github
#
cd ~vagrant
echo "Pull Ansible from Github into Vagrant home directory"
git clone git://github.com/ansible/ansible.git --recursive
#
echo "Install Ansible"
sudo make install
