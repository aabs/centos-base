#!/bin/bash -eux
pushd .
cd /tmp/ansible
ansible-playbook main.yml
popd
