# Installing the Ansible VM

Prerequisites:
* hypervisor environment supported by a vagrant provider plugin (VirtualBox, VMware Fusion, VMware Workstation...)
* vagrant
* vagrant provider plugin for the selected hypervisor environment

## Select the Vagrant file

Select the Vagrantfile you like from the topologies directory and copy it as _Vagrantfile_ into the parent directory.

## Create the Ubuntu VM (Ansible host)

From the main repository directory execute *vagrant up* optionally specifying the VM name (for example *vagrant up nms*) if your Vagrantfile has more
than one VM. You might have to specify the virtualization software you're using with the --provider flag. See vagrant documentation for more details.

## Installing the prerequisite software
* Log into the VM with *vagrant ssh*
* Change directory to _/vagrant/install_
* Execute *install.sh* (for example, with *bash install.sh*) to:
  * Update system software
  * Install required Ubuntu packages
  * Install Python modules required by YAML, Jinja2 and Ansible demos
  * Install Ansible, Junos EZPY and NAPALM
* Optionally install additional software you might need
  * Install PERL modules for the YAML demos with *install.perl.sh*

## More information

* [Ansible for Networking Engineers](http://www.ipspace.net/Ansible_for_Networking_Engineers) online course ([contents](https://my.ipspace.net/bin/list?id=AnsibleOC)) or
* [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course ([contents](https://my.ipspace.net/bin/list?id=NetAutSol))

