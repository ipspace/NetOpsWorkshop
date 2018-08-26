# Preparing the environment

* Start VIRL and Inter-AS topology
* Start Vagrant machine (nms)
* Collect SSH keys
```
cd /vagrant/Examples/6-router-setup/
source setup.sh
unset ANSIBLE_STDOUT_CALLBACK
../../tools/ssh-keys/get-keys.yml
``


