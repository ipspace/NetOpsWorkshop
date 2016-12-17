# Installing the Ansible VM

Prerequisites:
* hypervisor environment supported by a vagrant provider plugin (VirtualBox, VMware Fusion, VMware Workstation...)
* vagrant
* vagrant provider plugin for the selected hypervisor environment

## Select the Vagrant file
This directory contains several Vagrantfile variants. Choose one of them and copy it as _Vagrantfile_ into the parent directory:

* *Vagrantfile-Ansible* - single VM topology ready to use with Cisco VIRL or with any external lab
* *Vagrantfile-SRX* - Ansible VM + SRX VM. You can use this topology together with Cisco VIRL to create a lab with Junos and Cisco IOS/NXOS/IOS-XR devices.

## Create the Ubuntu VM (Ansible host)
From the main repository directory execute *vagrant up* optionally specifying the VM name (for example *vagrant up nms*). You might have to specify the virtualization software you're using with the --provider flag. See vagrant documentation for more details.

## Installing the prerequisite software
* Log into the VM with *vagrant ssh*
* Change directory to _/vagrant/install_
* Execute *install.sh* (for example, with *bash install.sh*) to:
  * Update system software
  * Install required Ubuntu packages
  * Install Python modules required by YAML, Jinja2 and Ansible demos
  * Install Ansible
* Optionally install additional software you might need
  * Install PERL modules for the YAML demos with *bash install.perl.sh*
  * Install Junos EZPY (required by Ansible Junos modules) with *bash install.ezpy.sh*

## Connect to the network nodes
* Log into the VM with *vagrant ssh*
* Change directory to _/vagrant/install_
* Edit the *hosts.yml* file (dictionary of hostnames and IP addresses)
* Save the changes and run fixup.sh script with *bash fixup.sh*
* Check the contents of /etc/hosts
* Telnet or SSH to lab nodes (hostnames specified in hosts.yml) to verify connectivity with the network nodes