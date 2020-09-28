# Ansible Inventory Demo Script

## Inventory in INI format

```
less hierarchy.ini
ansible-inventory -i hierarchy.ini --graph
ansible-inventory -i hierarchy.ini --graph zurich
```

## Inventory in YAML format

```
less hierarchy.yaml
ansible-inventory -i hierarchy.ini --graph
ansible-inventory -i hierarchy.ini --graph zurich
```

## Ranges of hosts

```
cat ranges.yaml
ansible-inventory -i ranges.yaml --graph
```

## Host and Group Facts in INI format

```
less values.ini
ansible-inventory -i values.ini --host l2-zh
ansible-inventory -i values.ini --host bl1-zh
ansible-inventory -i values.ini --graph --vars leafs_zurich
```

## Host and Group Facts in YAML format

```
less values.yaml
ansible-inventory -i values.yaml --host l2-zh
ansible-inventory -i values.yaml --host bl1-zh
ansible-inventory -i values.yaml --graph --vars leafs_zurich
```

## Host Variable Files

```
cat host_vars/s1-zh.yaml
ansible-inventory -i values.yaml --host s1-zh
```

## Inventory Sources

```
ansible-inventory -vvv --graph edge_zurich
cp backup.cfg ansible.cfg
cat ansible.cfg 
ansible-inventory -vvv --graph edge_zurich
export ANSIBLE_INVENTORY=values.yaml
ansible-inventory -vvv --graph --vars edge_zurich
ansible-inventory -vvv -i hierarchy.yaml --graph --vars edge_zurich
cat hierarchy.hosts.ini
cat hierarchy.groups.ini
ansible-inventory -vvv -i hierarchy.hosts.ini -i hierarchy.groups.ini --graph --vars edge