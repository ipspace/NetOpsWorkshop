# Sample lab topologies

You'll find Vagrantfile-s for several lab topologies in this directory:

* **VIRL** - Ansible VM to use with VIRL. Includes several Cisco IOS VIRL topologies. See [Using Ansible Playbooks with Cisco VIRL](http://automation.ipspace.net/Example:Using_Ansible_Playbooks_with_Cisco_VIRL) for details.
* **vSRX+VIRL** - Ansible VM + Juniper vSRX to use with VIRL. Includes a Cisco IOS + Nexus OS VIRL topology.
* **EOS-Leaf-and-Spine** - a full-leaf-and-spine topology with Arista vEOS and Ansible VM. The Vagrantfile in this directory uses YAML data file to specify lab topology.

The *tools* directory contains Vagrant-related tools

* **Vagrant2Inventory.py** - create Ansible inventory file from Vagrant printout (see [this article](http://automation.ipspace.net/Example:Creating_Ansible_Inventory_from_Vagrant_SSH_Configuration)) for details