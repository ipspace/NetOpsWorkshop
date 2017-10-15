# Compare State Snapshots

## Prepare for the demo

Setup:

    cd /vagrant/Examples/Compare-State-Snapshots/
    unset ANSIBLE_INVENTORY
    unset ANSIBLE_CONFIG
    /vagrant/tools/ssh-keys/get-keys.yml
    /vagrant/tools/config-actions/enable-lldp.yml
    /vagrant/tools/config-actions/no-banner.yml
    git checkout Compare-State-Initial

## Step 1: Time-dependent state

Collect the state

    ansible-playbook get-state.yml -e output=snapshot
    more snapshot/E1.yml

## Step 2: Fixed state gathering

Check out the final branch

    git checkout master

Collect state

    ansible-playbook get-state.yml -e output=snap_before
    colordiff -au snapshot snap_before|less -r

## Step 3: Break something

Log into one of the routers, turn off an interface

    sshpass -p cisco ssh cisco@172.16.1.111
    config terminal
    interface gig 0/2
    shutdown

Repeat state gathering

    ansible-playbook get-state.yml -e output=snap_after

Compare the state

    colordiff -au snap_before snap_after|less -r
