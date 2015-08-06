# docker-webcat
This Docker contains the [CombineArchiveToolkit WebApplication](https://sems.uni-rostock.de/trac/combinearchive-web)
running on a Tomcat7 with Java8.

## Building the Docker Container
To build this container make use of the build-script, which features two commands:
  ./build.sh fetch
  ./build.sh build

The fetch downloads the latest version of the webcat.war from the SEMS maven repository.
Whereas the build command starts the actuall build and automated tagging of the docker container.

## Run
  docker run -it --cap-add SYS_PTRACE -p 8080:8080 freakybytes/webcat:latest
