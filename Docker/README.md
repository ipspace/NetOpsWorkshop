# Build your own network automation container

The subdirectories of this directory contain _Dockerfile_ and related lists of packages, Python modules, and Ansible collections that result in a container-packaged network automation development environment including:

* Git
* Ansible
* NAPALM 
* PyATS
* PyNetBox
* jq
* yq
* YAMLlint

Each subdirectory contains a typical build script (_build.sh_) and a run script (_run.sh_) that you can use to start the container as non-root user.

Based on your preference for Linux distributions, you can build either a Centos-based or a Ubuntu-based container.

Please feel free to extend the container to fit your needs:

* To add Centos or Ubuntu packages, modify _requirements-yum.txt_ or _requirements-apt.txt_.
* To add your own Python-based tools to the container, modify _requirements.txt_
* To add Ansible collections, modify _requirements.yml_

If you're using Mac or Windows as your development environment use _Docker Desktop_ to create the containers, but if you're as paranoid about messing up your production laptop as I am, you might prefer using a Linux virtual machine. In that case, use _Vagrantfile_ in this directory to get a fully functional Ubuntu VM with Docker.

Finally, I'm positive it's perfectly possible to build a much more optimized container. Pull requests along these lines are highly appreciated.
