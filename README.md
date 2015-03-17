Manatí vagrant-playbooks
========================

Contains some scripts and config files used for different deploys using vagrant+ansible+playbooks.

For bringing up a simple vm that can be used for PHP development; just run the next command inside vagrant folder:

    vagrant up

Actually this is deploying a ubuntu precise VM (this should be updated).

For running a deploy script:

    ./run-playbook deploy/script.yml
