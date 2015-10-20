Manatí vagrant-playbooks
========================

Contains some scripts and config files used for different deploys using vagrant+ansible playbooks.

## Requirements
 * Virtualbox
 * Vagrant (It's recommended to install directly from official page)
 * Ansible (It's recommended to install directly from official page)

## Basic Usage
To bring up a simple VM (Virtual Machine) that can be used for PHP development, run the next command inside the root folder:

    vagrant up

If you need to provision again, run:

    vagrant provision

To connect via ssh to the vm:

    vagrant ssh

To restart the VM:

    vagrant reload

To use this VM, you just need to add a folder inside www (created at same level than root folder) and add your code there. Then, add a dns record in /etc/hosts for associating your_folder_name.local.dev with the VM IP (10.10.10.10). Example:

    example.local.dev  10.10.10.10

## Other features
This VM is shipped with apachesolr 3.6.2 (see instructions in next section), two webservers (apache and nginx), xhprof, xdebug and some other undocumented stuff.

In order to create a database, the VM installs mysql. With user: root, and password: password.
This values can be changed with the variable "mysql_root_password" in group_vars/dev_vm

### Apachesolr use
To create a core, just use the solr-core-add.yml script (See Running Deploy Scripts). Your new solr core admin UI is available at (http://hostname.local.dev:8888/solr/core_name/admin) and it could be used by Drupal at (http://hostname.local.dev:8888/solr/core_name)

### Multiple Webservers
By default, it's using apache as varnish backend. If you need to change it, just send `varnish_backed=nginx` in query string.
TIP: You can use the Chrome extension ModHeader to send headers and avoid needing to use GET arguments on every request.

### Variables management
Some configurations are managed by variables. You can find and change them in `/group_vars/dev_vm`

## Installed Softwared

Right now this is deploying an Ubuntu Trusty (14.04) VM.

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

## Running deploy scripts
To run a deploy script:

    ./run-playbook deploy/script.yml

You can use these scripts (located in the folder "deploy"):
 - Add DB and User in MySQL (mysql/mysql-add-db-and-user.yml)
 - Import DB (mysql/mysql-db-import.yml)
 - Solr Core Add (solr-cores/solr-core-add.yml)
 - Solr Core Delete (solr-cores/solr-core-delete.yml)
 - Varnish Disable (varnish/varnish-disable.yml)
 - Varnish Enable (varnish/varnish-enable.yml)
 - Install aquifer (aquifer/install-aquifer.yml)
