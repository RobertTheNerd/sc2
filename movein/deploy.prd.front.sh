#!/bin/bash

SCRIPT_PATH=`readlink -f $(dirname $0)`

source ${SCRIPT_PATH}/deploy.common.sh

artifact_dir=$SCRIPT_PATH/artifacts

# prd settings
warFile=www.website.prd.war
env=$SCRIPT_PATH/env/prd/website
# prd settings 

# setting up artifacts folder
pushd $SCRIPT_PATH

update_artifact $artifact_dir $warFile

deploy_web $artifact_dir/$warFile /srv/sites/sc2geeks/www/port.8868 localhost:8868 $env
deploy_web $artifact_dir/$warFile /srv/sites/sc2geeks/www/port.8869 localhost:8869 $env

popd


