# http://stackoverflow.com/questions/10108374/maven-how-to-run-a-java-file-from-command-line-passing-arguments
# http://stackoverflow.com/questions/778933/log4j-configuration-via-jvm-arguments

mvn exec:java -Dconfig="file:/pathtoconfigfile" -Dexec.args="fullupdate"  -Dlog4j.configuration="/Users/robert/data/SolrUpdater/log4j.properties"


mvn exec:java -Dconfig="file:/srv/sc2geeks/app/solrUpdater/config/config.xml" -Dexec.args="fullupdate"  -Dlog4j.configuration="file:/srv/sc2geeks/app/solrUpdater/log4j.properties"
