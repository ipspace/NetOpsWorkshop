# Ansible Variables Demo Script

## Inventory and Host/Group Variables

Variables in inventory file

```
more hosts.values.ini
ansible-inventory -i hosts.values.ini --host r1.lab.local
ansible-inventory -i hosts.values.ini --graph --vars
```

Variables in host_vars and group_vars

```
cat hosts.ini
tree *vars 
ansible-inventory --host r1.lab.local
cat host_vars/r2*/*
ansible-inventory --host r2.lab.local
ansible -m debug -a var=hostvars[inventory_hostname] r2.lab.local
```

## Fact Gathering

```
ansible -m setup localhost|less
```

## Play-Task-Block Variables

```
cat play-block-task-vars.yml
ansible-playbook play-block-task-vars.yml
cat play-task-facts.yml
ansible-playbook play-task-facts.yml 
cat play-block-facts.yml
ansible-playbook play-block-facts.yml  
```

## Fact Caching

```
cat fact-caching.yml
ansible-playbook fact-caching.yml
```

## Debugging Caching

```
cat debug.yml
ansible-playbook debug.yml
cat debug-dump-single.yml
ansible-playbook debug-dump-single.yml
cat localhost.files.txt
cat debug-dump-all.yml
ansible-playbook debug-dump-all.yml -l r2.lab.local
cat r2.lab.local.variables.txt
```
