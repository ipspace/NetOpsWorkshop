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
sudo apt-get -qq install python-yaml python-httplib2 python-pysnmp4
sudo pip install jinja2 six bracket-expansion netaddr
#
echo "Install optional Python components"
sudo pip install yamllint
#
# Install latest stable Ansible version from Ansible reposityr
#
sudo apt-get -qq install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get -qq update
sudo apt-get -qq install ansible
