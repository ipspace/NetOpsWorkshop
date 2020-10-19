FROM centos:centos8
LABEL author="Ivan Pepelnjak" \
  maintainer="ip@ipspace.net"
RUN echo "===> Install packages ..."
COPY requirements-yum.txt /tmp/requirements-yum.txt
RUN yum -y update && \
      yum install -y epel-release && \
      yum install --enablerepo=epel -y $(strings -1 /tmp/requirements-yum.txt | tr '\n' ' ')
RUN echo "===> Set 'python' to refer to python3 ..."
RUN alternatives --set python /usr/bin/python3
RUN echo "===> Install Ansible (Core & Collections) & dependency Python packages ..."
COPY requirements.txt /tmp/requirements.txt
COPY requirements.yml /tmp/requirements.yml
RUN pip3 install --upgrade -r /tmp/requirements.txt  && \
     ansible-galaxy collection install -r /tmp/requirements.yml
RUN echo "===> Clean up ..."
RUN yum clean all && \
      rm -rf /var/cache/yum /tmp/*
WORKDIR /ansible
