# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VER = "2"

Vagrant.configure("2") do |config|
  config.vbguest.auto_update = false
  config.vm.box_check_update = false
  config.vm.define "test" do |i|
    i.vm.box = "ubuntu/trusty64"
    i.vm.provision "shell", path: "../install/install.sh"
  end
end
