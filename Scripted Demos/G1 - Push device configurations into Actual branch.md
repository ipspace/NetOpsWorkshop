## Push device configurations into _Actual_ branch

* Create actual branch
```
pushd ../Private/ConfigRepo
git checkout -b actual
```
* Configuration changes are pushed into the `actual` branch
```
ansible-playbook getandcommit.yml -e git_branch=actual
```
* Change BGP neighbor description on R1
```
show run part router bgp 65001
configure terminal
router bgp 65001
neighbor 10.0.0.13 description ISP-A
```
* Commit the changes
```
ansible-playbook getandcommit.yml -e git_branch=actual
```
* Open GitLab in browser
* Open branches, compare actual and master
* Display local diff
```
pushd ../Private/ConfigRepo
git checkout actual
git diff master
```
* Create merge request actual-to-master
* Confirm merge request

