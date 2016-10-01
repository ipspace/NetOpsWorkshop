# Network Automation Workshop - Sources

This repository contains sources for all demos shown during the
Network Automation workshop:

## Subdirectories 
* YAML: YAML syntax examples (YAML section of the workshop)
* Jinja2: Sample templates (Jinja2 section of the workshop)
* Ansible: Ansible playbooks
  * Simple: simple actions using RAW module
  * Logging: create SNMP and logging configuration commands for Cisco IOS and Nexus OS
  * SNMPFacts: use SNMP facts in Ansible playbooks
  * Networking: Ansible Networking modules

## Installation

I'm running Ansible in a Ubuntu Vagrant box. Install Vagrant and VirtualBox (or VMware Fusion/Workstation if you're using VIRL) and start vagrant. Further Ubuntu installation scripts are in the _install_ directory.

The networking examples are focused on Cisco IOS and Nexus OS. You can run them in VIRL or have a Cisco router (or CSR 1000v) connected to a Nexus switch.

### Starting the Ubuntu VM

The _Vagrantfile_ in the Git repository contains definitions for Ubuntu VM (nms) and Juniper vSRX (srx). To start the Ubuntu VM
without the vSRX either comment out the vSRX-specific parts in Vagrantfile or start the VM with **vagrant up nms**.

**Note**: if you're using VMware Fusion or Workstation you _MUST_ specify the Vagrant provider in the **vagrant up** command with the
**--provider vmware_fusion** or **--provider vmware_workstation** flags.

### Adding Juniper vSRX to the examples

* Install Vagrant plugins required by Junos vSRX box:
```
$ vagrant install plugin vagrant-host-shell
$ vagrant install plugin vagrant-junos
```
* Uncomment vSRX definition in Vagrantfile
* Start the VM with **vagrant up srx** (or **vagrant up srx --provider vmware_fusion**)

<!--
* Cisco VIRL running a vIOS (_R1_) and a Nexus OS (_S1_) instances connected to external flat network
* Ubuntu server (_nms_) running _Ansible_. _nms_ is connected to the same subnet as _R1_ and _S1_.
-->
## Usage

Download, explore & enjoy... and when you discover you want to know more, [register for the network automation workshop](http://ipspace.net/NetOps).
