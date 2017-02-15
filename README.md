# docker

This is a dockerfile's code repository.

## 1. About files

### build docker image 
you can build the docker images by run `build.sh`.

### How to use docker image 
about how to use the image, please refer to `run.sh`

### Other files
There are other files which related with `Dockerfile`,
such as
* `startup.sh` which defines the how to run before the container runs your commands
* Some files as `settings.xml`, a configure file.

## Relation between images 

```
graph LR
base-->java
base-->nodejs
base-->chrome
base-->firefox
java-->selenium-chrome
```