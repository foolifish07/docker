# docker

This is a dockerfile for `firefox`, used as gui app.
It needs 
* `/tmp/.X11-unix`
* `DISPLAY` under your environment

## 1. About files

### build 
you can build the docker images by run `build.sh`.

### How to use docker image 
about how to use the image, please refer to `run.sh`,  
and in default, the script runs as a user with UID=1000