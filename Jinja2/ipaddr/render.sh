#!/bin/bash
echo "Rendering through Ansible..."
echo "FAILED" >/tmp/results.txt
ansible-playbook render.yml --extra-vars template=$1 >/dev/null
echo "YAML file:" >/tmp/output.txt
echo "=================" >>/tmp/output.txt
cat $1.yml >>/tmp/output.txt
echo "" >>/tmp/output.txt
echo "Jinja2 file:" >>/tmp/output.txt
echo "=================" >>/tmp/output.txt
cat $1.j2 >>/tmp/output.txt
echo "" >>/tmp/output.txt
echo "Results:" >>/tmp/output.txt
echo "=================" >>/tmp/output.txt
cat /tmp/results.txt >>/tmp/output.txt
less /tmp/output.txt
