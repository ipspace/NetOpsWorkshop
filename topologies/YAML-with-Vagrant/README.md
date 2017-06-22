# Using YAML to configure Vagrant

This directory contains a generic Vagrantfile that reads Vagrant configuration from *topology.yml* file.

## Format of the topology.yml file

Topology.yml file is a YAML document containing a list of VMs. Each VM description is a dictionary with these keys:

* **name** (mandatory) - VM name
* **box** (mandatory) - Vagrant box name
* **memory** (optional) - Memory allocated to virtual machine when running under VirtualBox (default: 2GB)
* **links** (optional) - Connections to private networks
* **forwarded_ports** (optional) - TCP ports forwarded from *localhost* to VM
* **folders** (optional) - Additional folders mapped to VM file system

### Links

Links parameter is a list of private networks to which the VM is connected. Each element of the list is a dictionary with these keys:

* **name** (mandatory) - link name
* **ip** (optional) - VM IP address (wishful thinking: not always set by Vagrant)

Example:
```
- name: leaf-2
  box: vEOS-lab-4.18.1F
  links:
    - name: S1L2
    - { name: S2L2, ip: "192.168.0.1" }
```

### Forwarded ports

The list of forwarded ports specifies all TCP ports that you want to have forwarded from *localhost* to the VM. Use it in VirtualBox environment to access services running on VMs (for example, SSH, HTTP(S) or NETCONF) on well-known statically-defined ports.

Each element in the list has the following parameters (dictionary keys):

* **guest** (mandatory) - TCP port number on guest VM
* **host** (mandatory) - TCP port number on *localhost*

Example:
```
- name: leaf-2
  box: vEOS-lab-4.18.1F
  forwarded_ports:
    - { guest: 22, host: 20004 }
    - { guest: 443, host: 21004 }
```

## Folders

By default Vagrant maps current directory into the /vagrant folder within the VM. You can specify additional folders with the **folders** parameter - a list of dictionaries, each one having two keys:

* **host** (mandatory): Relative path to target directory on the host
* **dir** (mandatory): Absolute file system path in the VM.

Example:
```
- name: nms
  box:  ubuntu/trusty64
  memory: 1024
  folders:
    - { host: "../nws/Examples", dir: "/Examples" }
``
