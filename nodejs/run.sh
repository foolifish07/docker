#!/bin/bash -exu

#============
# import config
#============
current_file_path=$(cd $(dirname "${0}"); pwd)
. ${current_file_path}/config.sh

#==============
# value needed
#==============
workspace="--volume=$(pwd):${project_in_docker}
		   --user=${user_in_docker}
		   --workdir=${project_in_docker}" 
volume_repositry="--volume=${HOME}/.npm:${nodejs_repositry_in_docker}"
image_name=${image_name}

#=============
# commands 
#=============
function npm(){
	docker run --rm \
		${workspace} \
		${volume_repositry} \
		${image_name} \
		npm ${@}
}
function node(){
	docker run --rm \
		${workspace} \
		${volume_repositry} \
		${image_name} \
		node ${@}
}


#===================
# test and examples
#===================
function try(){
	docker run --rm -it \
		${volume_project} \
		${volume_repositry} \
		${image_name} \
		bash
}

function example1(){
	npm install request
}

function example2(){
	npm install 
	npm build
}

example1