#!/bin/bash
#
# Update to latest release
#
sudo apt-get update
#
# Install missing packages
#
sudo apt-get install python-setuptools python-pip
#
# Install Python components
#
sudo pip install jinja2 bracket-expansion paramiko ecdsa
#
# Install PERL CPAN modules
#
sudo cpan install YAML File::Slurp Term::Screen
