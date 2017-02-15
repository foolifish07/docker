#!/bin/bash -exu

#================
# import config
#================
current_file_path=$(cd $(dirname "${0}"); pwd)
. ${current_file_path}/config.sh

: ${image_name:=foolifish07/java}

docker build -t ${image_name} ${current_file_path}