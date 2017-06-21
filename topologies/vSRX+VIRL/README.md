# Ansible VM and vSRX with VIRL

Use this *Vagrantfile* when you want to test a combination of Cisco devices (running in VIRL) and vSRX (running in Vagrant VM with VMware desktop virtualization provider).

The file creates:
* **nms** virtual machine running Ubuntu 14.04.
* **srx** virtual machine running vSRX box for VMware Vagrant providers.

Use the *install.sh* script to install Ansible and NAPALM on **nms**. More details in [this document](https://my.ipspace.net/bin/get?doc=ca659efe-f437-11e6-b42b-005056880254).

## Notes

* You **MUST** use VMware desktop virtualization product (Workstation or Fusion) - other hypervisors are not supported by VIRL.
* Use `--provider` argument when starting the Vagrant virtual machines for the first time; Vagrant might use the VirtualBox provider otherwise
* The Ansible and vSRX virtual machines are connected to *vmnet2* network (the VIRL management network) and use IP address 172.16.1.12 and 172.16.1.13.
* You might want to the included VIRL topology (with one Cisco IOS router and one Nexus-OS switch) as a starting point.

Read also:

* [Use Ansible playbooks with Cisco VIRL](http://automation.ipspace.net/Example:Using_Ansible_Playbooks_with_Cisco_VIRL)

## More information

* [Ansible for Networking Engineers](http://www.ipspace.net/Ansible_for_Networking_Engineers) online course ([contents](https://my.ipspace.net/bin/list?id=AnsibleOC))
* [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course ([contents](https://my.ipspace.net/bin/list?id=NetAutSol))

