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
function mvn(){
	docker run --rm \
		${workspace} \
		${volume_repositry} \
		${image_name} \
		mvn ${@}
}
function java(){
	docker run --rm \
		${workspace} \
		${volume_repositry} \
		${image_name} \
		java ${@}
}
function javac(){
	docker run --rm \
		${workspace} \
		${volume_repositry} \
		${image_name} \
		javac ${@}
}


#===================
# test and examples
#===================
function test1(){
	docker run --rm -it \
		${workspace} \
		${volume_repositry} \
		${image_name} \
		bash
}

function example1(){
	mvn -v
}

test1