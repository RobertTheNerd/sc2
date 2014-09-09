#!/bin/bash

scriptpath=$0
case $scriptpath in
 ./* )  SCRIPT_PATH=`pwd` ;;
  * )  SCRIPT_PATH=`dirname $scriptpath`
esac

$SCRIPT_PATH/webBuild.sh
$SCRIPT_PATH/apiBuild.sh

