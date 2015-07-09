# CombineArchiveToolkit - WebApplication (webCAT)
#  running on Debian8 backprot w/ openjdk8 and tomcat7

FROM freakybytes/debian8-tomcat7

# http://sems.uni-rostock.de/peters
MAINTAINER martin peters

# tomcat port
EXPOSE 8080

# install dependencies
#RUN apt-get update && \
#    apt-get install -y curl gawk

# add war file
ADD webcat.war /var/lib/tomcat7/webapp-cat/webcat.war
# add custom server.xml
ADD server.xml /var/lib/tomcat7/conf/server.xml
# add custom context.xml
ADD context.xml /var/lib/tomcat7/conf/Catalina/webcat/webcat.xml

ENTRYPOINT ["/opt/start-tomcat.sh"]
