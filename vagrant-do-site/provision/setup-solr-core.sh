#!/bin/bash

echo ''
echo '======================================================================='
echo 'Running site setup...'
cd /home/vagrant/playbooks
echo 'Creating solr core'
ansible-playbook --connection=local deploy/solr-cores/solr-core-add.yml -i vagrant/hosts
