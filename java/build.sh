#!/bin/bash -exu

#================
# import config
#================
here=$(cd $(dirname "${0}"); pwd)

image_name='foolifish07/java'

docker build \
	-t ${image_name} \
	${here}