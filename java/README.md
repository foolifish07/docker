# docker

This is a dockerfile for `Java-Maven`
Default maven repository:  
* `~/.m2`

## 1. About files

### build 
you can build the docker images by run `build.sh`.

### How to use docker image 
about how to use the image, please refer to `run.sh`,  
and in default, the script runs as a user with UID=1000

### Other
* `settings.xml` maven's configure file under `${maven_home}/conf/settings.xml`