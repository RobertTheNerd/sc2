#!/bin/bash

SCRIPT_PATH=`readlink -f $(dirname $0)`

source ${SCRIPT_PATH}/deploy.common.sh

artifact_dir=$SCRIPT_PATH/artifacts

# staging setting
warFile=service.imp-1.0.war
env=$SCRIPT_PATH/env/prd/api
# staging setting

# setting up artifacts folder
pushd $SCRIPT_PATH

#update_artifact $artifact_dir $warFile

deploy_api $artifact_dir/$warFile /srv/sites/sc2geeks/api localhost:7106 $env

popd
