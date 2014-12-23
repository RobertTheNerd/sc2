#!/bin/bash
function init_variables {
	base_dir=$1
	source_dir=$base_dir/source
	artifact_dir=$base_dir/artifacts
	export source_dir artifact_dir
}
function update_source {
	local source_dir=$1
	if [ ! -d $source_dir ]
	then
		mkdir -p $source_dir
		git clone https://github.com/RobertTheNerd/sc2-java.git $source_dir
	else
		if [ "$#" -eq 1 ] 
		then
			pushd $source_dir
			git fetch --all
			git reset --hard origin/master
			popd	
		fi
	fi
}
function publish_artifact {
	local built_war=$1
	local artifact_war=$2
	local msg=$3	
	svn update --accept 'mine-full' $artifact_war
	cp -f $built_war $artifact_war
	svn add $artifact_war
	svn ci $artifact_war -m 'build prd website $NOW' 
}

function build_with_commit {
	#input methods
	local source_war=$1
	local target_war=$2
	local working_folder=`readlink -f /tmp/$3`
	local config_folder=$4
	local target_folder=`readlink -f $workding_folder/$5`
	local commit_message=$6

	# entering working folder
	pushd $working_foler
	rm -rf *
	jar xvf $source_war

	# copy configuration files  
	cp -rf $config_folder/* $target_folder
	
	# compact again
	jar cfz $target_war ./

	# commit
	svn update --accept 'mine-full' $target_war
	svn ci $target_war -m '$commit_message'
	popd

}
