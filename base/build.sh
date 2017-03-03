#!/bin/bash -exu

here=$(cd $(dirname "${0}"); pwd)

docker build \
	-t "foolifish07/base" \
	${here}