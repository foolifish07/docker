#!/bin/bash -exu

#================
# import config
#================
current_file_path=$(cd $(dirname "${0}"); pwd)
. ${current_file_path}/config.sh


#==============
# value needed
#==============
workspace="--volume=$(pwd):${project_in_docker}
		   --user=${user_in_docker}
		   --workdir=${project_in_docker}"
volume_repositry="--volume=${HOME}/.m2:${maven_registry_in_docker}"
image_name=${image_name}


#=============
# commands 
#=============
function mvn_gui(){
	docker run --rm \
		${workspace} \
		${volume_repositry} \
		--privileged \
		--env="DISPLAY" \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		${image_name} \
		mvn ${@}
}
function mvn(){
	docker run --rm \
		${workspace} \
		${volume_repositry} \
		--privileged \
		${image_name} \
		mvn ${@}
}
function google-chrome(){
	docker run --rm \
		--privileged \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		--env="DISPLAY" \
	    ${image_name} \
	    google-chrome ${@}

}

#===================
# test and examples
#===================	
function test_mvn_gui(){
	docker run --rm -it \
		${workspace} \
		${volume_repositry} \
		--privileged \
		--env="DISPLAY" \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		${image_name} \
		bash
}
function test_mvn(){
	docker run --rm -it \
		${workspace} \
		${volume_repositry} \
		--privileged \
		${image_name} \
		bash
}


function example1(){
	google-chrome
}
function run_test(){
	mvn test -P run-test
}
function run_test_with_gui(){
	mvn_gui test -P run-test
}

test_mvn
# run_test