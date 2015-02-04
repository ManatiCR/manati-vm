#!/bin/bash

echo ''
echo '======================================================================='
echo 'Running site setup...'
cd /home/vagrant/playbooks
echo 'Creating site'
ansible-playbook --connection=local deploy/drupal-sites/drupal-dev-site-deploy.yml -i vagrant/hosts
