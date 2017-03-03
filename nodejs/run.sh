#!/bin/bash -exu

#================
# import config
#================
here=$(cd $(dirname "${0}"); pwd)

image_name="foolifish07/nodejs"
uid=$UID
user_in_docker="uid${uid}"
home_in_docker="/home/${user_in_docker}"
project_in_docker="${home_in_docker}/project"
nodejs_repositry_in_docker="${home_in_docker}/.npm"
nodejs_config_in_docker="${home_in_docker}/.npmrc"

#===================
# needed parameter
#===================
workspace="--volume=$(pwd):${project_in_docker}
		   --env=uid=${uid}"
volume_repositry="--volume=${HOME}/.npm:${nodejs_repositry_in_docker}"

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
		${volume_repositry} \
		${workspace} \
		${image_name} \
		bash
}

function example1(){
	npm -v
	node -v
}

function example2(){
	npm install 
	npm build
}

example1