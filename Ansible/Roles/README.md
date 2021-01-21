# Ansible Roles Demos

This directory contains demo playbooks used in *Roles* part of *[Creating Reusable Code](https://my.ipspace.net/bin/list?id=Ansible#INCLUDES)* section of *[Ansible for Networking Engineers](https://www.ipspace.net/Ansible_for_Networking_Engineers)* webinar.

## Role Includes

```
ansible-playbook config-simple.yml

ansible-playbook config-ospf.yml

ansible-playbook config-ospf-2.yml

cat config-ospf-area.yml  
ansible-playbook config-ospf-area.yml
ansible-playbook config-ospf-area.yml -t create

ansible-playbook config-complete.yml -e config_cleanup=true
tree configs 
```

## Role Imports and Includes

```
cat import-tasks.yml
ansible-playbook config-import.yml
cat config-include.yml 
ansible-playbook config-include.yml
```
