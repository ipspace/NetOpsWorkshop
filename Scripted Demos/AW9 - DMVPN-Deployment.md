# Build and deploy DMVPN configurations

Setup:

* Run DMVPN-topology.virl
* Execute these commands on NMS

```
cd /vagrant/Examples/DMVPN/
unset ANSIBLE_INVENTORY
unset ANSIBLE_CONFIG
export ANSIBLE_STDOUT_CALLBACK=selective
export ANSIBLE_CALLBACK_PLUGINS=`pwd`/../Plugins/callback/
export ANSIBLE_SELECTIVE_LINE_LENGTH=80
/vagrant/tools/ssh-keys/get-keys.yml
/vagrant/tools/config-actions/no-banner.yml
```

Build configs:

    ansible-playbook build.yml
    more configs/*.conf

Copy configs

    ansible-playbook deploy_scp.yml --tags copy
    ansible-playbook deploy_scp.yml --tags deploy

Check routing

    ssh cisco@172.16.1.110
    show ip bgp sum
    show run part router bgp 65000
