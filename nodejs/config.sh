#!/bin/bash -exu

# about user name refer to foolifish07/base	
user_in_docker="uid1000"
home_in_docker="/home/${user_in_docker}"
project_in_docker="${home_in_docker}/project"

nodejs_repositry_in_docker="${home_in_docker}/.npm"
nodejs_config_in_docker="${home_in_docker}/.npmrc"

image_name='foolifish07/nodejs'