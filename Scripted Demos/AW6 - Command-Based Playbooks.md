# Demo script for **Ansible Networking Modules - Command Playbooks** presentation

## Initial setup

```
cd /vagrant/Ansible/Networking
. setup.sh
cd /vagrant/Ansible/Networking/Command-Playbooks
```

## Collect printouts

```
ansible-playbook collect-printout-ios.yml
```

Explore `results` subdirectory

```
ansible-playbook collect-many-printouts-ios.yml
```

Explore `results` subdirectory


## Check device versions

```
more check-version.yml
more ../group_vars/ios.yml
ansible-playbook check-version.yml
```

```
more check-version-junos.yml
more ../group_vars/junos.yml
ansible-playbook check-version-junos.yml
```

```
more check-version-log.yml
ansible-playbook check-version-log.yml
cat version_report.txt
```

```
ansible-playbook check-version-log.yml --extra-vars version=15.6
```

## Check connectivity

```
more check-connectivity.yml
ansible-playbook check-connectivity.yml -l ios,nxos
```
