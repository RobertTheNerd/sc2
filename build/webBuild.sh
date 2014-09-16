#!/bin/bash 

target_war=www.website-0.9.war
NOW=$(date +"%Y-%m-%d %H:%M:%S")

SCRIPT_DIR=`readlink -f $(dirname $0)`

. $SCRIPT_DIR/common.sh
init_variables $SCRIPT_DIR # now we have $source_dir, $artifact_dir

update_source $source_dir

pushd $source_dir

# build prd website without resource files
mvn -pl website/www.website package -DskipTests -am
cp -f $source_dir/website/www.website/target/$target_war $artifact_dir/$target_war

# build normal website
# artifact_war=www.website.staging.war
# mvn -pl website/www.website package -DskipTests -am
# cp -f $source_dir/website/www.website/target/$target_war $artifact_dir/$artifact_war

popd
