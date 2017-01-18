Manatí VM
========================

[![Build Status](https://travis-ci.org/ManatiCR/manati-vm.svg?branch=master)](https://travis-ci.org/ManatiCR/manati-vm)

This is a lamp/lemp development machine.


## Requirements

 * Virtualbox
 * Vagrant (It's recommended to install directly from official page)
 * Ansible (It's recommended to install directly from official page)
 * NFS (It's installed by default in Mac, in Linux, you should install a package named `nfs-kernel-server`)

## Basic Usage

- To bring up a simple VM (Virtual Machine) that can be used for PHP development, run the next commands inside the root folder:

      sudo ansible-galaxy install -r provisioning/requirements.yml --force
      vagrant plugin install vagrant-hostsupdater

- Go to the VM root folder and copy `example.config.yml` to `config.yml`

- Open the `config.yml` file, follow the instructions into the file and  edit as necessary.

- Finally, execute:

      vagrant up

## Useful information

If you need to provision again (or have edited config.yml to add sites/databases/hosts), run:

    vagrant provision

To connect via ssh to the vm:

    vagrant ssh

To restart the VM:

    vagrant reload


## Importing databases.
To import databases we have a specialized script to make your life better, just follow the instructions bellow:

 - Go to your synced folder
 - Copy your database dump there (synced folder path)
 - Go to your VM root path
 - Execute: `./run-playbook deploy/mysql/mysql-db-import.yml`
 - And just follow the instructions given by the script.
## Other features

This VM is shipped with apachesolr, two webservers (apache and nginx), xdebug and some other undocumented stuff.

In order to create a database or add a site, edit config.yml and re-run `vagrant provision`

This machine uses NFS file sharing in order to share a folder that will have the sites (/www). If you have an encrypted home folder, NFS will most likely make your computer kaboom and the earth explode.

![Earth explode](http://www.contentthatworks.com/blogs/Pauls/wp-content/uploads/2013/05/earth-exploding-o.gif "Earth explode")

And there is no workaround for that. As per:

https://docs.vagrantup.com/v2/synced-folders/nfs.html

Therefore, it is advised to clone this repository in an unencrypted folder or if you're using Full Disk Encryption, your ok.

### Apachesolr use

To create a core, edit config.yml and re-run `vagrant provision`
Solr core will be accessible at `localhost:8983/solr/<core_name>`

### Multiple Webservers

By default this is the shipped configuration:
- nginx: port 80
- apache: port 81
- varnish: port 82 using nginx as backend

You can change those settings in config.yml file and run `vagrant provision` to apply your changes.

### Variables management

Some configurations are managed by variables. You can find and change them in `config.yml`

## Installed Software

Right now this is deploying an Ubuntu Trusty (14.04) VM.

This config creates a VM with this software:
 - vim
 - mysql
 - solr
 - apache (2.4)
 - nginx
 - varnish  
 - php
 - drush (cloning from 8.x branch)
 - Some other stuff

## Running deploy scripts
To run a deploy script:

    ./run-playbook deploy/script.yml
