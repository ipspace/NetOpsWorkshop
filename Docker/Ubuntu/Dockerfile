FROM ubuntu:20.04
LABEL author="Ivan Pepelnjak" \
  maintainer="ip@ipspace.net"
RUN echo "===> Install packages ..."
COPY apt-install.sh /tmp/apt-install.sh
COPY requirements-apt.txt /tmp/requirements-apt.txt
RUN bash /tmp/apt-install.sh
RUN echo "===> Install Ansible (Core & Collections) & dependency Python packages ..."
COPY requirements.txt /tmp/requirements.txt
COPY requirements.yml /tmp/requirements.yml
RUN pip3 install --upgrade -r /tmp/requirements.txt  && \
     ansible-galaxy collection install -r /tmp/requirements.yml
RUN echo "===> Clean up ..."
RUN apt clean && \
      rm -rf /tmp/*
WORKDIR /ansible
