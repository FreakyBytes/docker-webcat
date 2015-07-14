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
COPY webcat.war /var/lib/tomcat7/webapp-webcat/webcat.war
# add custom server.xml
COPY server.xml /var/lib/tomcat7/conf/server.xml
# add custom context.xml
COPY context.xml /var/lib/tomcat7/context/webcat.xml
# add helper script
COPY start-webcat.sh /usr/bin/start-webcat.sh
RUN chmod +x /usr/bin/start-webcat.sh

# set ownership for configs
RUN mkdir -p /var/lib/tomcat7/context && \
    chown tomcat7:tomcat7 -R /var/lib/tomcat7/webapp-webcat && \
    chown root:tomcat7 -R /var/lib/tomcat7/conf/server.xml /var/lib/tomcat7/context && \
    chmod u=rwx -R /var/lib/tomcat7/webapp-webcat && \
    chmod g+rx -R /var/lib/tomcat7/conf/server.xml /var/lib/tomcat7/context

# preparing storage dir
RUN mkdir -p /var/webcat/data && chown tomcat7:tomcat7 -R /var/webcat
VOLUME ["/var/webcat"]

ENTRYPOINT ["/usr/bin/start-webcat.sh"]
