## Merge individual changes as feature branches

* Change interface description on R1
```
sshpass -p cisco ssh cisco@172.16.1.101
show run interface gig0/1
configure terminal
interface gig0/1
description Uplink to ISP-A
```
* Create loopback interface on R3
```
sshpass -p cisco ssh cisco@172.16.1.103
configure terminal
interface loopback 1
description fake loopback
```
* Commit the changes
```
ansible-playbook getandcommit.yml -e git_branch=actual
```
* Display local diff
```
pushd ../Private/ConfigRepo
git checkout actual
git diff master
```
* Commit my changes to feature branch
```
pushd ../Private/ConfigRepo
git checkout master
git checkout -b Desc_ISP_A
git checkout actual R1.cfg
git commit -a -m 'Changed interface description on gig 0/1'
git push --all
```
