# Network Automation Workshop - Sources

This repository contains sources for all demos shown during the
[Network Automation workshop](http://www.ipspace.net/NetAutWS)
and [Ansible webinar](http://www.ipspace.net/Ansible):

## Subdirectories 
* Install: Lab installation guidelines
* YAML: YAML syntax examples (YAML section of the workshop)
* Jinja2: Sample templates (Jinja2 section of the workshop)
* Ansible: Ansible playbooks
  * Simple: simple actions using RAW module
  * Logging: create SNMP and logging configuration commands for Cisco IOS and Nexus OS
  * SNMPFacts: use SNMP facts in Ansible playbooks
  * Networking: Ansible Networking modules
* Examples: Further Ansible examples from ansible-examples repository

## Installation

I'm running Ansible in a Ubuntu Vagrant box. Install Vagrant and VirtualBox (or VMware Fusion/Workstation if you're using VIRL) and start vagrant. Further Ubuntu installation scripts are in the _install_ directory.

The networking examples are focused on Cisco IOS and Nexus OS. You can run them in VIRL or have a Cisco router (or CSR 1000v) connected to a Nexus switch.

### Starting the Ubuntu VM

Various _Vagrantfile_ versions in _install_ directory contain different test environments. Select the one you prefer and copy it into _Vagrantfile_ in top directory. 

To start the Ubuntu VM start the VM with **vagrant up nms**. To start the whole test environment use **vagrant up**. Continue the installation process using the instructions in the [_install_ directory] (install).

**Note**: if you're using VMware Fusion or Workstation you _MUST_ specify the Vagrant provider in the **vagrant up** command with the
**--provider vmware_fusion** or **--provider vmware_workstation** flags the first time you're starting the VM.

### Adding Juniper vSRX to the examples

* Use _Vagrantfile-SRX_ file
* Install Vagrant plugins required by Junos vSRX box:
```
$ vagrant install plugin vagrant-host-shell
$ vagrant install plugin vagrant-junos
```
* Start the VM with **vagrant up srx** (or **vagrant up srx --provider vmware_fusion**)

<!--
* Cisco VIRL running a vIOS (_R1_) and a Nexus OS (_S1_) instances connected to external flat network
* Ubuntu server (_nms_) running _Ansible_. _nms_ is connected to the same subnet as _R1_ and _S1_.
-->
## Usage

Download, explore & enjoy... and when you discover you want to know more, [register for the network automation workshop](http://ipspace.net/NetOps).
