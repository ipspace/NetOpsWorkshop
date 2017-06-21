# Collect SSH keys from managed devices

The playbook collects SSH keys from devices listed in inventory file using either **ansible_host** or **inventory_hostname** to connect to the device.

The collected keys are stored in an Ansible-managed block in SSH **known_hosts** file (default: per-user file, change the playbook or overwrite the default with --extra-vars)

Credits: based on [this article](http://everythingshouldbevirtual.com/ansible-ssh-known-host-keys) on Everything Should be Virtual.

## Usage 

Download, explore & enjoy... and when you discover you want to know more, register for the:

* [Ansible for Networking Engineers](http://www.ipspace.net/Ansible_for_Networking_Engineers) online course ([contents](https://my.ipspace.net/bin/list?id=AnsibleOC)) or
* [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course ([contents](https://my.ipspace.net/bin/list?id=NetAutSol))
