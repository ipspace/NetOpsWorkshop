#!/bin/bash
#
# Run Ansible Fixup playbook to add hostnames to /etc/hosts
#
echo 'localhost' >/tmp/ansible.hosts
ansible-playbook -i /tmp/ansible.hosts fixup.yml
rm /tmp/ansible.hosts
#
# Copy ssh configuration to vagrant home directory
#
mkdir -p ~/.ssh
cp ssh.config ~/.ssh/config
