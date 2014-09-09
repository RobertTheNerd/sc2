#!/bin/bash
<<test1
SCRIPT_DIR=`readlink -f $(dirname $0)`

echo $SCRIPT_DIR/common.sh
source $SCRIPT_DIR/common.sh

init_variables $SCRIPT_DIR
echo $source_dir 
echo $artifact_dir
test1

<<test2
function testb 
{
	echo "number of parameters $#"
	#if  [ [ $1 ] || [ "$#" -eq 1 ]]  then
	if $1 ; then
		echo 'true'
	else
		echo 'false'
	fi
}
testb true
test2

function dummy {
	local name='robert'
}

dummy
echo $name
