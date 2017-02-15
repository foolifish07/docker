#!/bin/bash -exu


#================
# import Config
#================
current_file_path=$(cd $(dirname "${0}"); pwd)
. ${current_file_path}/config.sh

: ${image_name:='foolifish07/base'}

docker build -t ${image_name} ${current_file_path}