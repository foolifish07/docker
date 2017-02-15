#!/bin/bash -exu

#================
# import config
#================
current_file_path=$(cd $(dirname "${0}"); pwd)

docker build -t 'foolifish07/chrome' ${current_file_path}