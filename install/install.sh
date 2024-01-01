#!/bin/bash
#
# Remove reference to obsolete PuppetLabs repository
# Update to latest release
#
cat <<EOM
Ansible/NAPALM/pyATS installation script
=====================================================================
This script updates your system, installs additional APT and PIP
packages, and installs Ansible, NAPALM, pyATS and ntc-templates

The script was adapted for and tested (in January 2024) on Ubuntu 20.04
and Ubuntu 22.04. Do not use it on earlier versions of Ubuntu or other
Linux distributions.

NOTE: the script is set to abort on first error. If the installation
completed you're probably OK even though you might have seen errors
during the installation process.
=====================================================================
EOM
set -e
#
# Comment the next line if you want to have verbose installation messages
#
QUIET="-qq"
REPLACE="--ignore-installed --upgrade"
SUDO='sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a'
echo "Update installed software to latest release (might take a long time)"
$SUDO apt-get $QUIET update
$SUDO apt-get $QUIET -y upgrade >/dev/null
#
# Install missing packages
#
echo "Install missing packages (also a pretty long operation)"
$SUDO apt-get $QUIET -y install python3 python3-setuptools ifupdown python3-pip >/dev/null
echo "Fix Python SSL/cryptography packages"
sudo pip3 install $REPLACE $QUIET pyopenssl cryptography
echo "Install nice-to-have packages"
$SUDO apt-get $QUIET -y install git ack-grep jq tree sshpass colordiff >/dev/null
#
# Install Ansible and NAPALM dependencies
#
echo "Install Python development and build modules"
$SUDO apt-get $QUIET -y install build-essential python3-dev libffi-dev >/dev/null
echo "Installing NAPALM dependencies"
$SUDO apt-get $QUIET -y install libxslt1-dev libssl-dev python3-lxml >/dev/null
#
# Install Python components
#
echo "Install baseline Python components"
sudo pip3 install $REPLACE $QUIET testresources pyyaml httplib2 pysnmp
sudo pip3 install $REPLACE $QUIET jinja2 six bracket-expansion netaddr
#
echo "Install Ansible Python dependencies"
echo ".. pynacl"
sudo pip3 install $REPLACE $QUIET pynacl
echo ".. paramiko netmiko"
sudo pip3 install $REPLACE $QUIET paramiko netmiko
#
echo "Install optional Python components"
sudo pip3 install $REPLACE $QUIET yamllint textfsm ttp jmespath
#
# Install latest Ansible version with pip
#
echo "Installing Ansible"
sudo pip3 install $QUIET ansible
#
# Install NAPALM
#
echo "Installing NAPALM, pyATS and ntc-templates"
sudo python3 -m pip install $REPLACE $QUIET junos-eznc
sudo python3 -m pip install $REPLACE $QUIET requests
sudo python3 -m pip install $QUIET napalm pyats ntc-templates
sudo python3 -m pip install $QUIET genie
echo
echo "Installing napalm-ansible into .ansible/napalm-ansible"
mkdir -p ~/.ansible
git clone -q https://github.com/napalm-automation/napalm-ansible.git ~/.ansible/napalm-ansible
echo ======================================================================
echo "To use napalm-ansible, add contents of ansible.cfg from this directory"
echo "into your ansible.cfg file (or into /etc/ansible.cfg)"
echo ======================================================================
echo
echo "Installing ntc-templates into .ansible/ntc-templates"
git clone -q https://github.com/networktocode/ntc-templates.git ~/.ansible/ntc-templates
echo ======================================================================
echo TextFSM templates are available in ~/.ansible/ntc-templates/templates
echo ======================================================================
echo
echo "Installation complete. Let's test Ansible version"
echo
ansible-playbook --version
