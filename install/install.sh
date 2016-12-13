#!/bin/bash
#
# Update to latest release
#
echo "Update installed software to latest release"
sudo apt-get update
#
# Install missing packages
#
echo "Install missing packages"
sudo apt-get install python-setuptools python-pip git ack-grep
#
# Install Python components
#
echo "Install required Python components"
sudo pip install PyYAML jinja2 httplib2 six bracket-expansion pysnmp netaddr
#
# Install PERL CPAN modules
#
echo "Install PERL modules"
sudo cpan install YAML File::Slurp Term::Screen
#
# Install Junos EZPY
#
sudo apt-get install python-dev libxslt1-dev libssl-dev libffi-dev
sudo apt-get install python-libxml2 python-libxslt1 python-lxml
pip install junos-eznc jxmlease