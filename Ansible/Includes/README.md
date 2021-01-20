# Ansible Includes Demos

This directory contains demo playbooks used in *Imports* and *Includes* part of *[Creating Reusable Code](https://my.ipspace.net/bin/list?id=Ansible#INCLUDES)* section of *[Ansible for Networking Engineers](https://www.ipspace.net/Ansible_for_Networking_Engineers)* webinar.

## Playbook-level Imports

```
ansible-playbook create-configs-initial.yml
cat create-configs.yml
ansible-playbook create-configs.yml
ansible-playbook create-configs.yml -e config_cleanup=true
vi create-configs.yml
ansible-playbook create-configs.yml
```

## Task Imports

```
cat import-tasks.yml
ansible-playbook import-tasks.yml
ansible-playbook import-tasks.yml -t debug
```

## Task Includes

```
ansible-playbook include-tasks.yml
ansible-playbook include-tasks.yml -t debug
```

```
ansible-playbook include-tasks-tags.yml -t debug
```

## Dynamic Included File Names

```
ansible-playbook configs-tasks.yml
```

## Multi-Platform Playbooks

```
ansible-playbook ping-gw.yml
```

## Included Loops

```
ansible-playbook ping-mesh.yml
```
