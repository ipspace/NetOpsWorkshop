# Deploy OSPF in a Fabric

Setup:

    cd /vagrant/Examples/OSPF-Deployment/
    unset ANSIBLE_INVENTORY
    unset ANSIBLE_CONFIG
    /vagrant/tools/ssh-keys/get-keys.yml

Shut down a port

    sshpass -p cisco ssh cisco@172.16.1.111
    config terminal
    interface gig 0/2
    shutdown

Configure LLDP and validate fabric connectivity

    ansible-playbook validate-fabric.yml

Re-enable port, repeat the validation

    ansible-playbook validate-fabric.yml --tags validate

Create the OSPF configuration

    ansible-playbook deploy.yml --tags clean,configs
    more configs/E1.ospf.cfg

Check the configuration changes

    ansible-playbook deploy.yml --tags deploy --check
    more configs/changes.txt

Execute the change, validate OSPF operations

    ansible-playbook deploy.yml --tags deploy,validate
    more configs/changes.txt

Check idempotency

    ansible-playbook deploy.yml --tags deploy --check

Fix `ios/ospf-config.j2`, rerun

    ansible-playbook deploy.yml --tags configs,deploy --check
