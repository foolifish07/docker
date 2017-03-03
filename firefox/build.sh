#!/bin/bash -exu

#================
# import config
#================
here=$(cd $(dirname "${0}"); pwd)

docker build -t 'foolifish07/firefox' ${here}