# docker

This is a dockerfile for `chrome`

Tips:
* when runs docker, it needs `--privileged` parameter,
so that chrome can enable `sand box` inside the container,
eitherwise, you need to run chrome as `google-chrome --no-sandbox`.
* when runs the container as a root user, chrome needs the user to
enable the `--no-sandbox` parameter. 

## 1. About files

### build 
you can build the docker images by run `build.sh`.

### How to use docker image 
about how to use the image, please refer to `run.sh`,
and in default, the script runs as a user with UID=1000