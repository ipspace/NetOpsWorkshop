# Simple reports

Setup:

    cd /vagrant/Examples/Summary-Reports/
    source setup.sh

## Getting and inspecting LLDP neighbor data

    cd ../LLDP-to-Graph
    ansible-playbook LLDP-test.yml
    ../../tools/config-actions/enable-lldp.yml
    ansible-playbook LLDP-test.yml

## Create a simple links report

    ansible-playbook LLDP-to-Graph.yml \
      -e template=links.j2 \
      -e output=links.txt

## Create a simple graph

    ansible-playbook LLDP-to-Graph.yml \
      -e template=graph-simple.j2
    more network.dot
    dot network.dot -Tpng >network.png

Open network.png in host UI

## Create a graph with interfaces

    ansible-playbook LLDP-to-Graph.yml
    more network.dot
    dot network.dot -Tpng >network.png

Open network.png in host UI

## Create a graph with interfaces and short hostnames

    ansible-playbook LLDP-to-Graph.yml -e no_domain=1
    more network.dot
    dot network.dot -Tpng >network.png

Open network.png in host UI