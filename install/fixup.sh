#!/bin/bash
#
# Run Ansible Fixup playbook to add hostnames to /etc/hosts
#
ansible-playbook -i hosts fixup.yml
