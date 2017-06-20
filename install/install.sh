#!/bin/bash
#
# Remove reference to obsolete PuppetLabs repository
# Update to latest release
#
set -e
echo "Update installed software to latest release (might take a long time)"
sudo rm -fr /etc/apt/sources.list.d/puppetlabs.list
sudo apt-get -qq update
#
# Install missing packages
#
echo "Install missing packages (also a pretty long operation)"
sudo apt-get -qq install python-setuptools python-pip git ack-grep jq tree
#
# Install Ansible and NAPALM dependencies
#
echo "Install Ansible dependencies"
sudo apt-get -qq install build-essential
echo "Installing NAPALM dependencies"
sudo apt-get -qq install libxslt1-dev libssl-dev libffi-dev python-dev python-cffi
#
# Install Python components
#
echo "Install baseline Python components"
# sudo apt-get -qq install python-yaml python-httplib2 python-pysnmp4
sudo pip install -q pyyaml httplib2 pysnmp
sudo pip install -q jinja2 six bracket-expansion netaddr
#
echo "Install Ansible Python dependencies"
echo ".. cffi"
sudo pip install -q cffi
sudo pip install -q --upgrade cffi
echo ".. pynacl"
sudo pip install -q pynacl
#
echo "Install optional Python components"
sudo pip install -q yamllint
#
# Install latest Ansible version with pip
#
echo "Installing Ansible"
sudo pip install -q ansible
#
# Install NAPALM
#
echo "Installing NAPALM and Junos EZPY"
sudo pip install -q napalm-eos napalm-ios napalm-junos napalm-nxos napalm-iosxr
sudo pip install -q --no-deps napalm