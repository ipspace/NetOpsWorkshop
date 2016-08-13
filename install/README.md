# Installing the Ansible VM

Prerequisites:
* vagrant
* vagrant provider (VirtualBox, VMware Fusion, VMware Workstation...)

## Create the vagrant VM
From the main repository directory execute *vagrant up*. You might have to specify the virtualization software you're using with the --provider flag. See vagrant documentation for more details.

## Installing the prerequisite software
* Log into the VM with *vagrant ssh*
* Change directory to _/vagrant/install_
* Execute *install.sh* (for example, with *bash install.sh*) to:
  * Update system software
  * Install required Ubuntu packages
  * Install Python modules required by YAML, Jinja2 and Ansible demos
  * Install PERL modules for the YAML demos
* Execute *ansible-distro.sh* to install Ansible Ubuntu package or *ansible-github.sh* to pull Ansible source code straight from Github (warning: it might be totally broken)

## Connect to the network nodes
* Edit the *hosts* file in the */vagrant/install* directory
  * Change the current IP address in the *hosts=...* line to IP addresses of your Cisco IOS router (r1.lab.local) and Nexus switch (s1.lab.local)
* Save the changes and run fixup.sh script
* Check the contents of /etc/hosts
* Telnet or SSH to r1.lab.local and s1.lab.local to verify connectivity with the network nodes