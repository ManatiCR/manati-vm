Manatí vagrant-playbooks
========================

Contains some scripts and config files used for different deploys using vagrant+ansible playbooks.

# Requirements
 * Virtualbox
 * Vagrant (It's recommended to install directly from official page)
 * Ansible (It's recommended to install directly from official page)

For bringing up a simple vm that can be used for PHP development; just run the next command inside root folder:

    vagrant up
    
If you need to provision again, just run:

    vagrant provision
    
For ssh into the vm:

    vagrant ssh

For restarting vm:

    vagrant reload
    
For using this vm, you just need to add a folder inside www (created at same level than root folder) and add your code there. Then add a dns record in /etc/hosts for associating {your-folder-name}.local.dev with the vm IP (10.10.10.10). Example:

    example.local.dev  10.10.10.10

Actually this is deploying a ubuntu trusty (14.04) VM.

This config creates a VM with this software:
 - vim (with some customizations)
 - etckeeper
 - memcache
 - mysql
 - redis
 - tomcat
 - solr (3.6.2)
 - apache (2.4)
 - nginx
 - varnish
 - node (most recent version)
 - php
 - ruby
 - drush (cloning from master branch)
 - imagemagick (6.9.2.4)

For running a deploy script:

    ./run-playbook deploy/script.yml
    
Actually, you could use these scripts:
 - Add DB and User in MySQL (mysql/mysql-add-db-and-user.yml)
 - Solr Core Add (solr-cores/solr-core-add.yml)
 - Solr Core Delete (solr-cores/solr-core-delete.yml)
 - Varnish Disable (varnish/varnish-disable.yml)
 - Varnish Enable (varnish/varnish-enable.yml)
 - Install aquifer (aquifer/install-aquifer.yml)
