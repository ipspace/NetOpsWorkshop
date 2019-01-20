#!/bin/bash
#
export ANSIBLE_CONFIG=`readlink -f ansible.cfg`
export ANSIBLE_INVENTORY=`readlink -f hosts`
#
echo "Set Ansible configuration file to $ANSIBLE_CONFIG"
echo "Ansible inventory used: $ANSIBLE_INVENTORY"
