# Demo script for **Ansible Networking Modules - Managing Configurations** presentation

## Initial setup

* Start the virtual lab;
* Start the Ansible virtual machine
* Log into the Ansible virtual machine

```
. .prompt
rm .ssh/known_hosts
cd /vagrant/Ansible/Networking
. setup.sh
../../tools/ssh-keys/get-keys.yml
cd Setup
ansible-playbook config-eem-applet.yml
ansible-playbook config-simple-cleanup.yml
ansible-playbook config-acl-preset.yml
ansible-playbook clean-bgp-ios.yml -l r2.lab.local -t clean
cd ../Configuration
```

## Configure SNMP

```
ansible-playbook config-simple.yml --check
ansible-playbook config-simple.yml --check -v
sshpass -p cisco ssh cisco@172.16.1.100 show log
ansible-playbook config-simple.yml -v
sshpass -p cisco ssh cisco@172.16.1.100 show log
ansible-playbook config-simple.yml -v
```

## Configure BGP Neighbor

```
ansible-playbook -v config-bgp-ios.yml --check -l r1.lab.local
ansible-playbook -v config-bgp-ios.yml -l r1.lab.local
sshpass -p cisco ssh cisco@172.16.1.100 "show running | section router bgp"
ansible-playbook cisco-ios-bgp-as.yml
ansible-playbook config-bgp-ios-check.yml
```

## Configure ACLs

```
export ANSIBLE_STDOUT_CALLBACK=yaml
ansible-playbook -v config-acl-add.yml -l r1.lab.local
sshpass -p cisco ssh cisco@172.16.1.100 "show run | sect Allow"
ansible-playbook -v config-acl-add-exact.yml -l r1.lab.local
sshpass -p cisco ssh cisco@172.16.1.100 "show run | sect Allow"
ansible-playbook -v config-acl-add-before.yml -l r1.lab.local
sshpass -p cisco ssh cisco@172.16.1.100 "show run | sect Allow"
```

## Deploying Configuration Files

```
ansible-playbook config-logging.yml
ansible-playbook config-snmp-template.yml
```
