#
# Test all versions of Vagrantfiles
#
vagrant destroy -f
set -e
cp Vagrantfile.trusty.vb Vagrantfile
vagrant up --provider virtualbox
vagrant destroy -f
cp Vagrantfile.xenial.bento Vagrantfile
vagrant up --provider virtualbox
vagrant destroy -f

