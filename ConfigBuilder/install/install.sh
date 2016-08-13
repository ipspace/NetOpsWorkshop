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