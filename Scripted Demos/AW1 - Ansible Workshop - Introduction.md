# Ansible Workshop (1 day)

## Setup

* Start and simple Ansible topology
* Start nms VM
* Log into nms VM

```
. .prompt
cd /vagrant/
```

## Simple examples

```
cd /vagrant/Ansible/Simple
ansible -i hosts -a "show version" all
ansible -i shosts -a "show version" all
ansible -m raw -i shosts -a "show version" all

ansible -m raw -i shosts -a "show arp" all
ansible -m raw -i ghosts -a "show arp" ios
ansible -m raw -i ghosts -a "show ip arp" nxos
export ANSIBLE_INVENTORY="`pwd`/ghosts"
```

## Playbooks

```
ansible-playbook -i ghosts show-arp-simple-fail.yml
ansible-playbook -i ghosts show-arp-simple.yml
ansible-playbook -i ghosts show-arp-simple.yml -v

export ANSIBLE_STDOUT_CALLBACK=yaml
ansible-playbook -i ghosts show-arp-simple.yml -v

ansible-playbook -i ghosts show-arp-simple-show.yml
ansible-playbook -i ghosts show-arp-simple-debug.yml
```
