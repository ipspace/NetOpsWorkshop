# Managing network device configurations with Git

## Setup

* Run 3-router VIRL topology
* Setup 3-router environment in `/vagrant/Examples/3-router-setup`
* Prepare routers for automation
```
../../tools/ssh-keys/get-keys.yml
../../tools/config-actions/enable-scp.yml
```
* Erase and recreate https://gitlab.com/ipspace/ConfigRepo
* Remove /vagrant/Examples/Private/ConfigRepo
* Create a new local clone with git `clone git@gitlab.com:ipspace/ConfigRepo.git`
* Create an initial commit in `master` branch and push it to GitLab

## Simple capture-and-commit

* Grab and commit all configs with
```
cd /vagrant/Examples/Config-to-Git
ansible-playbook gc_napalm.yml -e git_branch=master
```
* Examine configuration files
```
more ../Private/ConfigRepo/*cfg
```
* Commit to master branch
```
ansible-playbook git_commit.yml -e git_branch=master
```
* Remove banners and commit changes
```
../../tools/config-actions/no-banner.yml
ansible-playbook getandcommit.yml -e git_branch=master
```
* Inspect https://gitlab.com/ipspace/ConfigRepo/commits/master in browser
* View history in master branch
* Click on commit name to get list of changes
* Click on a file to get more information about that file
