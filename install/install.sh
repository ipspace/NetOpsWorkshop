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

The script was tested on Ubuntu 14.04 but probably works on 16.04 as well.

NOTE: the script is set to abort on first error. If the installation
completed you're probably OK even though you might have seen errors
during the installation process.
==================================
EOM
set -e
echo "Update installed software to latest release (might take a long time)"
sudo rm -fr /etc/apt/sources.list.d/puppetlabs.list
sudo apt-get -qq update
#
# Install missing packages
#
echo "Install missing packages (also a pretty long operation)"
sudo apt-get -qq install python-setuptools 
echo "Install nice-to-have packages"
sudo apt-get -qq install git ack-grep jq tree sshpass colordiff
#
# Install Ansible and NAPALM dependencies
#
echo "Install Python development and build modules"
sudo apt-get -qq install build-essential
sudo apt-get -qq install python-dev
sudo apt-get -qq install libffi-dev
sudo -H PYTHONWARNINGS=ignore easy_install -q pip==9.0.3
sudo -H PYTHONWARNINGS=ignore pip install -qq --ignore-installed --upgrade setuptools
sudo -H PYTHONWARNINGS=ignore pip install -qq --ignore-installed --upgrade urllib3[secure]
echo "Installing NAPALM dependencies"
sudo apt-get -qq install libxslt1-dev libssl-dev python-lxml
#
# Install Python components
#
echo "Install baseline Python components"
sudo -H PYTHONWARNINGS=ignore pip install -qq --ignore-installed --upgrade cffi
sudo -H PYTHONWARNINGS=ignore pip install -qq --ignore-installed --upgrade pyyaml httplib2 pysnmp
echo "NOTE: Jinja2 installation generates compiler errors. Ignore them"
sudo -H PYTHONWARNINGS=ignore pip install -qq jinja2 six bracket-expansion netaddr
#
echo "Install Ansible Python dependencies"
echo ".. pynacl"
sudo -H PYTHONWARNINGS=ignore pip install -qq --upgrade --ignore-installed pynacl
#
echo "Install optional Python components"
sudo -H PYTHONWARNINGS=ignore pip install -qq yamllint textfsm jmespath
#
# Install latest Ansible version with pip
#
echo "Installing Ansible"
sudo -H PYTHONWARNINGS=ignore pip install -qq ansible
#
# Install NAPALM
#
echo "Installing NAPALM and Junos EZPY"
sudo -H PYTHONWARNINGS=ignore pip install -qq --upgrade --ignore-installed napalm napalm-ansible
echo "Installation complete. Let's test Ansible and NAPALM version"
echo
ansible-playbook --version
napalm-ansible
