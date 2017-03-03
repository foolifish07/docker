#!/bin/bash

function switch_user(){
	local username="uid${uid}"
	echo "docker image: switch to user ${username}"

	useradd -ms /bin/bash ${username} -u ${uid}
	mkdir -p /home/${username}/project
	cd /home/${username}/project
	chmod 777 /home/${username}

	make_commands_file ${@}
	local commands=/tmp/commands.sh

	su ${username} \
		--command "bash ${commands}"
	exit
}

function make_commands_file(){
	local commands=/tmp/commands.sh

	# copy PATH from ROOT PATH before running commands
	echo "export PATH=${PATH};" > ${commands}
	echo 'echo ${UID}' >> ${commands}
	echo 'pwd' >> ${commands}
	echo ${@} >> ${commands}
	# add rights
	chmod 777 ${commands}
	
	# print the commands file
	echo ''
	echo -e "\033[45;37m Commands: "
	cat ${commands}
	echo -e '\033[0m'
}

echo "Command: ${@}"
if [ ${uid} ]
then 
	switch_user ${@}
else
	exec ${@}	
fi