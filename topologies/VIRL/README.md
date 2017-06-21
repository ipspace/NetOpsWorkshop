# Ansible in a VM with VIRL

Use this *Vagrantfile* when running Ansible in a Vagrant-connected VM with VIRL. The file creates **nms** virtual machine. Use the *install.sh* script to install Ansible and NAPALM on it. More details in [this document](https://my.ipspace.net/bin/get?doc=ca659efe-f437-11e6-b42b-005056880254).

## Notes

* Use `--provider` argument when starting the Vagrant virtual machine for the first time; Vagrant might use the VirtualBox provider otherwise
* The Ansible VM is connected to *vmnet2* network (the VIRL management network) and uses IP address 172.16.1.12
* You **MUST** use VMware desktop virtualization product (Workstation or Fusion) - other hypervisors are not supported by VIRL.
* You might want to use one of the included VIRL topologies as a starting point.

Read also:

* [Use Ansible playbooks with Cisco VIRL](http://automation.ipspace.net/Example:Using_Ansible_Playbooks_with_Cisco_VIRL)
