# Ansible debugging

## Preparing the environment

* Start VIRL and _Inter-AS Configured_ topology
* Start Vagrant machine (nms)
* Use 6-router setup

    cd /vagrant/Examples/6-router-setup
    source setup.sh

* Collect SSH keys

    cd /vagrant/Examples/LLDP-to-Graph
    ../../tools/ssh-keys/get-keys.yml

## Using 'debug' module

* Run the data gathering playbook

    ansible-playbook -l E1 LLDP-test.yml

* Enable LLDP

    ../../tools/config-actions/enable-lldp.yml

* Rerun the data gathering playbook

    ansible-playbook -l E1 LLDP-test.yml

## Using Ansible debugger

