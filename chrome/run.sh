#!/bin/bash -exu

function google-chrome(){
	docker run --rm \
		--privileged \
	    --env="DISPLAY" \
		--env="uid=2222" \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	    'foolifish07/chrome'
}

function google-chrome-no-sandbox(){
	docker run --rm \
	    --env="DISPLAY" \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	    'foolifish07/chrome' \
	    google-chrome-stable --no-sandbox
}

#=====================
# Tests and Examples
#=====================
function try(){
	echo ${DISPLAY} 
	docker run --rm -it \
		--privileged \
	    --env="DISPLAY" \
	    --env="uid=2222" \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	    'foolifish07/chrome' \
	    bash
}

function example1(){
	google-chrome
}

function example2(){
	google-chrome --no-sandbox
}

example1
# example2