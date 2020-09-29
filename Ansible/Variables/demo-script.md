# Ansible Variables Demo Script

Prepare for the demo

* Change prompt if needed
* Unset all Ansible environment variables

```
export PS1='\033[33m\W\[\033[00m $ '
```

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

## Debugging

Inspecting registered variables

```
cat get-files.yml
ansible-playbook -v get-files.yml
export ANSIBLE_STDOUT_CALLBACK=yaml
ansible-playbook -v get-files.yml
unset ANSIBLE_STDOUT_CALLBACK 
cat debug.yml
ansible-playbook debug.yml
export ANSIBLE_STDOUT_CALLBACK=yaml
ansible-playbook debug.yml
```

Dumping variables into files

```
cat debug-dump-single.yml
ansible-playbook debug-dump-single.yml
cat localhost.files.txt
cat debug-dump-all.yml
ansible-playbook debug-dump-all.yml -l r2.lab.local
cat r2.lab.local.variables.txt
```
