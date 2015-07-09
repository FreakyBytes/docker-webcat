#!/bin/sh

if [ -f /config/context.xml ]
then
	echo "Loading user context.xml"
	rm /var/lib/tomcat7/conf/Catalina/webcat/webcat.xml
	ln -s /config/context.xml /var/lib/tomcat7/conf/Catalina/webcat/webcat.xml
fi

if [ -f /config/server.xml ]
then
	echo "Loading user server.xml"
	rm /var/lib/tomcat7/conf/server.xml
	ln -s /config/server.xml /var/lib/tomcat7/conf/server.xml
fi

# starting tomcat start script
/usr/bin/tomcat-start.sh
