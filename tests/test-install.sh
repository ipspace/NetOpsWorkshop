#
# Test all versions of Vagrantfiles
#
vagrant destroy -f
set -e
cp Vagrantfile.bento.18-04 Vagrantfile
vagrant up --provider virtualbox
vagrant destroy -f

