#!/bin/bash -exu

#===============
# import config
#===============
current_file_path=$(cd $(dirname "${0}"); pwd)
. ${current_file_path}/config.sh

#==============
# value needed
#==============
image_name=${image_name}

#==============
# build image
#==============
docker build -t ${image_name} ${current_file_path}