#!/bin/bash -exu

function firefox(){
	docker run --rm \
	    --env="DISPLAY" \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	    'foolifish07/firefox'
}

#=====================
# Tests and Examples
#=====================
function try(){
	docker run --rm -it \
	    --env="DISPLAY" \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	    'foolifish07/firefox' \
	    bash
}

function example1(){
	firefox
}

try