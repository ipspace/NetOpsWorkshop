# vEOS running in Vagrant/VirtualBox

Use this *Vagrantfile* to build a leaf-and-spine network of vEOS switches.

## Getting started

* Install VirtualBox and Vagrant
* Copy correct *Vagrantfile* and *topology.yml* into an empty directory
* Download vEOS box from Arista and install it as **vEOS** Vagrant box. More details in [Building the Lab Environment tutorial](https://github.com/dravetech/network-tutorials/tree/master/tutorial-0-building-env) by David Barroso

Notes:

* vEOS needs serial port emulation that's implemented with virtual pipes resulting in name conflicts on Windows. Make sure you use the correct Vagrantfile.
* Linux version of the Vagrantfile should work on OSX as well. If it doesn't please submit a pull request.
* If needed change the vEOS box name in *topology.yml* to whatever box you created from downloaded vEOS box.
* Remove the 'memory' parameters from *topology.yml* if you have enough physical memory (VirtualBox default = 2048MB).
* Remove **nms** virtual machine from *topology.yml* if you want to run Ansible on your host machine.
* Use the *install.sh* script to install Ansible and NAPALM on **nms**. More details in [this document](https://my.ipspace.net/bin/get?doc=ca659efe-f437-11e6-b42b-005056880254).
* Use the *hosts.vm* inventory if you're running Ansible in **nms** virtual machine or *hosts.local* inventory if you're running Ansible on the host.

## More information

* [Ansible for Networking Engineers](http://www.ipspace.net/Ansible_for_Networking_Engineers) online course ([contents](https://my.ipspace.net/bin/list?id=AnsibleOC))
* [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course ([contents](https://my.ipspace.net/bin/list?id=NetAutSol))

