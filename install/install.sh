#!/bin/bash
#
# Remove reference to obsolete PuppetLabs repository
# Update to latest release
#
cat <<EOM
Ansible/NAPALM installation script
==================================
This script updates your system, installs additional APT and PIP
packages, and installs Ansible with NAPALM.

The script was adapted for and tested on Ubuntu 18.04. Do not use it
on earlier versions of Ubuntu.

NOTE: the script is set to abort on first error. If the installation
completed you're probably OK even though you might have seen errors
during the installation process.
==================================
EOM
set -e
#
# Comment the next line if you want to have verbose installation messages
#
QUIET="-qq"
REPLACE="--ignore-installed --upgrade"
echo "Update installed software to latest release (might take a long time)"
sudo apt-get $QUIET update
#
# Install missing packages
#
echo "Install missing packages (also a pretty long operation)"
sudo apt-get $QUIET install python-setuptools ifupdown python-pip >/dev/null
echo "Install nice-to-have packages"
sudo apt-get $QUIET install git ack-grep jq tree sshpass colordiff >/dev/null
#
# Install Ansible and NAPALM dependencies
#
echo "Install Python development and build modules"
sudo apt-get $QUIET install build-essential python-dev libffi-dev >/dev/null
echo "Installing NAPALM dependencies"
sudo apt-get $QUIET install libxslt1-dev libssl-dev python-lxml >/dev/null
#
# Install Python components
#
echo "Install baseline Python components"
sudo pip install $REPLACE $QUIET pyyaml httplib2 pysnmp
sudo pip install $REPLACE $QUIET jinja2 six bracket-expansion netaddr
#
echo "Install Ansible Python dependencies"
echo ".. pynacl"
sudo pip install $REPLACE $QUIET pynacl
#
echo "Install optional Python components"
sudo pip install $REPLACE $QUIET yamllint textfsm jmespath
#
# Install latest Ansible version with pip
#
echo "Installing Ansible"
sudo pip install $QUIET ansible
#
# Install NAPALM
#
echo "Installing NAPALM and Junos EZPY"
sudo pip install $QUIET napalm napalm-ansible
echo "Installation complete. Let's test Ansible and NAPALM version"
echo
ansible-playbook --version
echo
napalm-ansible
