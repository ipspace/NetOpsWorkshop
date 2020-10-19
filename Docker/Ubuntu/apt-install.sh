#!/bin/bash
# set noninteractive installation
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update -yq
apt-get upgrade -yq
apt-get install -yq tzdata
# set your timezone
dpkg-reconfigure --frontend noninteractive tzdata
apt-get install -yq $(cat /tmp/requirements-apt.txt | tr '\n' ' ')
