#!/bin/bash

function switch_user(){
	local username="uid${uid}"
	echo "docker image: switch to user ${username}"

	useradd -ms /bin/bash ${username} -u ${uid}
	su - ${username} -c "${@}"
	exit
}

echo "Command: ${@}"
if [ ${uid} ]
then 
	switch_user ${@}
else
	exec ${@}	
fi