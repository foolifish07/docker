#!/bin/bash -exu

user_in_docker="uid1000"
home_in_docker="/home/${user_in_docker}"
project_in_docker="${home_in_docker}/project"

maven_registry_in_docker="${home_in_docker}/.m2"

image_name='foolifish07/selenium-chrome'