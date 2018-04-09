## Change configs from Git

* Grab actual device configuration and push it into Git
```
ansible-playbook gc_scp.yml -e git_branch=actual
pushd ../Private/ConfigRepo
git diff master
popd
ansible-playbook git_commit.yml -e git_branch=actual
```
* Create a feature branch
```
pushd ../Private/ConfigRepo
git checkout master
git pull
git checkout -b ISP_B
```
* Change R1 in feature branch: under `router bgp` add
```
 neighbor 10.0.0.17 remote-as 65010
 neighbor 10.0.0.17 description ISP-B
```
* Display local diff and commit changes
```
git diff
git commit -a -m 'Uplink to ISP_B'
git push --all
```
* Merge ISP_B into Actual on GitLab using merge request
* Install changes to network devices
```
export ANSIBLE_STDOUT_CALLBACK=selective
ansible-playbook --check gi_napalm.yml
ansible-playbook gi_napalm.yml
```
* Verify successful deployment
```
sshpass -p cisco ssh cisco@172.16.1.101
```
* Fix BGP configuration
* Download the changes and commit them
```
ansible-playbook gc_scp.yml -l R1 -e git_branch=ISP_B
pushd ../Private/ConfigRepo
git diff
git commit -a -m 'Fix ISP-B AS number'
git push --all
```
* Validate master == actual
```
ansible-playbook gc_scp.yml -e git_branch=actual
ansible-playbook git_commit.yml -e git_branch=actual
pushd ../Private/ConfigRepo
git pull --all
git diff origin/master
```
