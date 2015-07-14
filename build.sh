#!/bin/sh

webcatFile="webcat.war"
baseUrl="http://mvn.sems.uni-rostock.de/releases/de/unirostock/sems/CombineArchiveWeb"

if [ "$1" = "fetch" ]
then
	echo "checking for current webCAT version..."
	version=$(curl $baseUrl/maven-metadata.xml 2> /dev/null | iconv -f utf-8 | gawk "BEGIN{ ver=0; } { if( match(\$0, /<version>(.*)<\/version>/, grp) ) ver=grp[1]; } END { print ver; }")
	echo $version > webcat.version
	echo "downloading version  $version"
	rm -f ./$webcatFile
	curl -o "./$webcatFile" "$baseUrl/$version/CombineArchiveWeb-${version}.war" 	

elif [ "$1" = "build" ]
then
	if [ ! -f "webcat.war" ]
	then
		echo "webcat.war not found"
		# fetching
		./build.sh fetch
	fi

	echo "build docker image"
	docker build -t webcat .	

else
	echo "usage:"
	echo "    build.sh fetch               - Downloads the current webCAT version"
	echo "    build.sh build               - start building the docker image, downloads webCAT if necessary"
fi


