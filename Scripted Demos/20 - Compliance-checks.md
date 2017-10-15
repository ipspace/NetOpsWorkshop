# Compliance checks

Setup:

    cd /vagrant/Examples/Summary-Reports/
    source setup.sh

Breaking config:

    cd /vagrant/Examples/Sample-Compliance-Check
    ansible-playbook breakConfig.yml

Run a simple proof-of-concept code

    ansible-playbook check-community.yml -v

Extend the code with a report

    ansible-playbook check-community-report.yml
    cat results/errors.log

Final playbook (run a battery of tests)

    ansible-playbook check-final.yml
    cat results/errors.log
