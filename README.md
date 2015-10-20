Manatí vagrant-playbooks
========================

Contains some scripts and config files used for different deploys using vagrant+ansible playbooks.

For bringing up a simple vm that can be used for PHP development; just run the next command inside root folder:

    vagrant up

Actually this is deploying a ubuntu trusty VM.

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
