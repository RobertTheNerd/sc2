port assignments

		shutdown	http	ajp
solr	6805		6806	6807
api		7101		7102	7103
front	7111		7112	7113


host names
	slrq			-- solr query server
	ApiServer		-- api server
	replaydb		-- replay db server


# run scripts below to set up the build environment

mkdir source
svn co https://subversion.assembla.com/svn/sc2nerd/sourcecode/sc2geeks/web source
