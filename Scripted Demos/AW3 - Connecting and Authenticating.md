# Demo script for **Ansible Networking Modules - Executing Commands** presentation

## Initial setup

```
. ~/.prompt
rm ~/.ssh/known_hosts
cd /vagrant/Ansible/Simple
export ANSIBLE_INVENTORY="`pwd`/ghosts"
cd /vagrant/Ansible/Networking
../../tools/ssh-keys/get-keys.yml
cd Commands
```

## Execute simple commands

```
ansible-playbook -v ios-command.yml -l r1.lab.local
```

## Process command results

```
ansible-playbook ios-command-multiple.yml
more r1.lab.local.txt
ansible-playbook nxos-command-json.yml
cat s1.lab.local.txt
```

## Command logging

Window #1

```
ssh cisco@172.16.1.100
(log in)
conf t
login on-success log
!
event manager applet CLIlog
 event cli pattern ".*" sync no skip no
 action 1.0 syslog priority informational msg "$_cli_msg"
 action 2.0 set _exit_status "1"
end
term mon
```

Window #2

```
ansible-playbook ios-command-multiple.yml -l r1.lab.local
```

## Limited command set

Window #1

```
conf t
username ansible password 0 cisco
username ansible privilege 2 view Ansible
!
parser view Ansible
 secret 5 $1$slTy$cA/Hk/M4F72Msr5BZaHzA/
 commands exec include terminal length
 commands exec include terminal width
 commands exec include show arp
 commands exec include show version
end
```

Window #2

```
ansible-playbook ios-command-multiple.yml -e ansible_user=ansible -l r1.lab.local
```

## Using cli_command

```
ansible-playbook cli-command-simple.yml
ansible -m cli_command -a 'command="show version"' -e ansible_connection=network_cli all
ansible-playbook cli-clear-counters.yml
```
