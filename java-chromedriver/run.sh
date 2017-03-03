#!/bin/bash -exu

#================
# import config
#================
here=$(cd $(dirname "${0}"); pwd)

user_in_docker="uid${UID}"
home_in_docker="/home/${user_in_docker}"
project_in_docker="${home_in_docker}/project"

maven_registry_in_docker="${home_in_docker}/.m2"

image_name='foolifish07/java-chromedriver'

#==============
# value needed
#==============
workspace="--volume=$(pwd):${project_in_docker}
		   --env=uid=${UID}"
volume_repositry="--volume=${HOME}/.m2:${maven_registry_in_docker}"

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
		${workspace} \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		--env="DISPLAY" \
	    ${image_name} \
	    google-chrome ${@}
}

#====================
# test and examples
#====================	
function try_mvn_gui(){
	docker run --rm -it \
		${workspace} \
		${volume_repositry} \
		--privileged \
		--env="DISPLAY" \
	    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		${image_name} \
		bash
}
function try_mvn(){
	docker run --rm -it \
		${workspace} \
		${volume_repositry} \
		--privileged \
		${image_name} \
		bash
}

function test1(){
	mvn '-v; pwd; echo $PATH; echo $UID; java -version; '
	mvn_gui '-v; echo $UID'
	google-chrome
}

function run_test(){
	mvn test -P run-test
}
function run_test_with_gui(){
	mvn_gui test -P run-test
}

# test2
test1
