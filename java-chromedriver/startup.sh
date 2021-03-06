#!/bin/bash

#===========================
# Create a virtual monitor
#===========================
# nohup Xvfb :1 -screen 0 1024x768x16 > /dev/null 2>&1 &
supervisord -c /tmp/supervisor.xvfb.conf

# <hostname>:<display>.<monitor>
: ${DISPLAY:=:1.0}
export DISPLAY

function switch_user(){
	local username="uid${uid}"
	echo "docker image: switch to user ${username}"

	useradd -ms /bin/bash ${username} -u ${uid}
	mkdir -p /home/${username}/project
	cd /home/${username}/project
	chmod 777 /home/${username}

	make_commands_file
	local commands=/tmp/commands.sh

	su ${username} \
		--command "bash ${commands}"
	exit
}

function make_commands_file(){
	# copy PATH from ROOT PATH before running commands
	local commands=/tmp/commands.sh
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
