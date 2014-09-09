#!/bin/bash

SCRIPT_PATH=`readlink -f $(dirname $0)`

source ${SCRIPT_PATH}/deploy.common.sh

artifact_dir=$SCRIPT_PATH/artifacts

# staging setting
warFile=www.website.staging.war
env=$SCRIPT_PATH/env/staging/website
# staging setting

# setting up artifacts folder
pushd $SCRIPT_PATH

update_artifact $artifact_dir $warFile

deploy_web $artifact_dir/$warFile /srv/sites/sc2geeks/voidray localhost:7112 $env

popd
