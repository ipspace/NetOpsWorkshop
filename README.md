# Network Automation Workshop - Sources

This repository contains sources for all demos shown during the
Network Automation workshop:

## Automated deployments

__ConfigBuilder__ directory contains all demos in the _Automated deployments_ part of the workshop. The demo setup includes:

* Cisco VIRL running a vIOS (_R1_) and a Nexus OS (_S1_) instances connected to external flat network
* Ubuntu server (_nms_) running _Ansible_. _nms_ is connected to the same subnet as _R1_ and _S1_.

### Subdirectories 
* ConfigBuilder/YAML: YAML syntax examples
* ConfigBuilder/Jinja2: Sample templates
* ConfigBuilder/Ansible: Ansible playbooks
  * Simple: simple actions using RAW module
  * Logging: create SNMP and logging configuration commands for Cisco IOS and Nexus OS
  * Facts: use SNMP facts in Ansible playbooks
* ConfigBuilder/Ansible.v21: New networking modules introduced in Ansible 2.1

## Usage

Download, explore & enjoy... and when you discover you want to know more, [register for the network automation workshop](http://ipspace.net/NetOps).
