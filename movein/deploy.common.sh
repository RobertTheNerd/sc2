function deploy_web {
	local war=$1
	local tomcatFolder=$2
	local site=$3
	local env=$4
	local sitemap=sitemap.xml

	# prepare tomcat & site folder
	$tomcatFolder/bin/shutdown.sh

	# wait for 5 seconds to clean up
	sleep 5

	local siteRoot=$tomcatFolder/webapps/ROOT
	if [ ! -d $siteRoot ]
	then
	    mkdir $siteRoot
	else
    	    mv $siteRoot/$sitemap $siteRoot/../
	    rm $siteRoot/* -rf
	    mv $siteRoot/../$sitemap $siteRoot/
	fi

	# deploy site & start tomcat
	cd $siteRoot
	jar xvf $war
	echo Deployed: $NOW >> sentry.txt
	cp -rf $env/* .
	$tomcatFolder/start.sh

	#  warm up website
	echo Warming up for site ${site} ...
	sleep 5
	#wget -O /dev/null http://${site}/replay/index.html
	#wget -O /dev/null  http://${site}/replay/replay/EGIdrA-27574.html
	echo done for site ${site}!
}
function deploy_api {
	local warFile=$1
	local tomcatFolder=$2
	local site=$3
	local env=$4

	# prepare tomcat & site folder
	$tomcatFolder/bin/shutdown.sh

	# wait for 5 seconds to clean up
	sleep 5

	local siteRoot=$tomcatFolder/webapps/ROOT
	if [ ! -d $siteRoot ]
	then
	    mkdir $siteRoot
	else
	    rm $siteRoot/* -rf
	fi

	# deploy site & start tomcat
	cd $siteRoot
	jar xvf $warFile
	echo Deployed: $NOW >> sentry.txt
	cp -rf $env/* .
	$tomcatFolder/start.sh

	#  warm up website
	#echo Warming up for site ${site} ...
	#sleep 5
	#wget -O /dev/null  http://${site}/replay/replay/EGIdrA-27574.html
	#echo done for site ${site}!
}

function update_artifact {
	local folder=$1
	local targetFile=$2
	if [ ! -d $folder ]
	then
    	mkdir $folder -p
    	svn co http://svn.goldenviewtech.com/sc2geeks/process/build/artifacts/ $folder
	else
    	svn update --force $folder/$targetFile
	fi
}
