#!/bin/bash
#
# Example shell script to run post-provisioning.
#
# This script configures the default Apache Solr search core to use one of the
# Drupal Solr module's configurations. This shell script presumes you have
# `solr` in the `installed_extras`, and is currently set up for the D7 versions
# of Apache Solr Search or Search API Solr.

SOLR_SETUP_COMPLETE_FILE=/etc/drupal_vm_solr_config_complete

# Search API Solr module.
SOLR_DOWNLOAD="http://ftp.drupal.org/files/projects/search_api_solr-7.x-1.x-dev.tar.gz"
SOLR_DOWNLOAD_DIR="/tmp"
SOLR_MODULE_NAME="search_api_solr"
SOLR_VERSION="5.x"
SOLR_CORE_BASE_PATH="/var/solr/data/"

# Download and expand the Solr module.
wget -qO- $SOLR_DOWNLOAD | tar xvz -C $SOLR_DOWNLOAD_DIR

for SOLR_CORE_PATH in $(find $SOLR_CORE_BASE_PATH -type d);
do
  # Copy the Solr configuration into place over the default `collection1` core.
  sudo cp -a $SOLR_DOWNLOAD_DIR/$SOLR_MODULE_NAME/solr-conf/$SOLR_VERSION/. $SOLR_CORE_PATH/conf/

  # Adjust the autoCommit time so index changes are committed in 1s.
  sudo sed -i 's/\(<maxTime>\)\([^<]*\)\(<[^>]*\)/\11000\3/g' $SOLR_CORE_PATH/conf/solrconfig.xml

  # Fix file permissions.
  sudo chown -R solr:solr $SOLR_CORE_PATH/conf
done

# Restart Apache Solr.
sudo service solr restart
