#!/bin/bash
#
# Update to latest release
#
echo "Update installed software to latest release"
sudo apt-get -qq update
#
# Install missing packages
#
echo "Install missing packages"
sudo apt-get -qq install python-setuptools python-pip git ack-grep jq
#
# Install Python components
#
echo "Install required Python components"
sudo pip install PyYAML jinja2 httplib2 six bracket-expansion pysnmp netaddr
#
echo "Install optional Python components"
sudo pip install yamllint
#
# Install latest stable Ansible version from Ansible reposityr
#
sudo apt-get -qq install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get -qq update
sudo apt-get -qq install ansible
