#!/bin/bash 

target_war=service.imp-1.0.war
NOW=$(date +"%Y-%m-%d %H:%M:%S")

SCRIPT_DIR=`readlink -f $(dirname $0)`

. $SCRIPT_DIR/common.sh
init_variables $SCRIPT_DIR # now we have $source_dir, $artifact_dir

update_source $source_dir

# build the api
pushd $source_dir
mvn -pl website/service.client,website/service.imp install -DskipTests -am
popd

#update artifact
#svn update --accept 'mine-full' $artifact_dir/$target_war
cp -f $source_dir/website/service.imp/target/$target_war $artifact_dir/$target_war
#svn add $artifact_dir/$target_war
#svn ci $artifact_dir/$target_war -m 'build api $NOW' 
