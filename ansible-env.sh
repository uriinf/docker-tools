#!/bin/bash
cd /usr/local/ansible
git checkout $ANSIBLE_BRANCH
git pull --rebase
git submodule update --init --recursive
source ./hacking/env-setup
ansible --version
