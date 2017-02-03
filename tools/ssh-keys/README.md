# Collect SSH keys from managed devices

The playbook collects SSH keys from devices listed in inventory file using either **ansible_host** or **inventory_hostname** to connect to the device.

The collected keys are stored in an Ansible-managed block in SSH **known_hosts** file (default: per-user file, change the playbook or overwrite the default with --extra-vars)

Credits: based on [this article](http://everythingshouldbevirtual.com/ansible-ssh-known-host-keys) on Everything Should be Virtual.