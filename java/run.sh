#!/bin/bash -exu

#================
# import config
#================
here=$(cd $(dirname "${0}"); pwd)

user_in_docker="uid${UID}"
home_in_docker="/home/${user_in_docker}"
project_in_docker="${home_in_docker}/project"

maven_registry_in_docker="${home_in_docker}/.m2"

image_name='foolifish07/java'

#================
# value needed
#================
workspace="--volume=$(pwd):${project_in_docker}
		   --env=uid=${UID}"
volume_repositry="--volume=${HOME}/.m2:${maven_registry_in_docker}"

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
	mvn -v && echo ${UID}

	java -version
}

# test1
example1