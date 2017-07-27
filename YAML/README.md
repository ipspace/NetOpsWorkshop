# YAML examples

This repository contains sources for YAML demos shown during the
[Network Automation workshop](http://www.ipspace.net/NetAutWS)
and [Ansible online course](http://www.ipspace.net/Ansible):

## Usage
* **y2py** is a Python script that reads the YAML file specified on the command line, reports any parsing errors produced by Python YAML parser, and prints Python data structure equivalent to input YAML file
* **y2js** is a YAML-to-JSON converter: it prints JSON data structure equivalent to YAML file specified on the command line
* **y2pl** is the Perl version of **y2py**

## Installation

Python modules needed to run **y2py** are installed with the [install script](../install/install.sh)

Perl modules needed to run **y2pl** are installed with the **install-perl-cpan.sh** script 

## Notes

Perl version of YAML parser does not parse a single-value YAML document. Running **y2pl** on **0-Value.yml** will results in an error.

## More information

* [Ansible for Networking Engineers](http://www.ipspace.net/Ansible_for_Networking_Engineers) online course ([contents](https://my.ipspace.net/bin/list?id=AnsibleOC)) or
* [Building Network Automation Solutions](http://www.ipspace.net/Building_Network_Automation_Solutions) online course ([contents](https://my.ipspace.net/bin/list?id=NetAutSol))

