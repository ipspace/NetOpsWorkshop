#!/bin/bash
#
export ANSIBLE_CONFIG="$PWD/ansible.cfg"
export ANSIBLE_INVENTORY="$PWD/hosts"
#
echo "Set Ansible configuration file to $ANSIBLE_CONFIG"
echo "Ansible inventory used: $ANSIBLE_INVENTORY"
