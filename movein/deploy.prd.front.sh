#!/bin/bash

SCRIPT_PATH=`readlink -f $(dirname $0)`

source ${SCRIPT_PATH}/deploy.common.sh

artifact_dir=$SCRIPT_PATH/artifacts

# prd settings
warFile=www.website-0.9.war
env=$SCRIPT_PATH/env/prd/www
# prd settings 

# setting up artifacts folder
pushd $SCRIPT_PATH

update_artifact $artifact_dir $warFile

deploy_web $artifact_dir/$warFile /srv/sites/sc2geeks/www localhost:7121 $env

popd


