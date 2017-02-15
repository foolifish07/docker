FROM debian:latest

# Refer: https://hub.docker.com/_/buildpack-deps/

# Author
MAINTAINER foolifish07 <foolifish07@gmail.com>


# For regions in china refer: http://mirrors.163.com/.help/debian.html
# RUN echo '\n deb http://mirrors.163.com/debian/ jessie main non-free contrib \
# 		  \n deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib \
# 		  \n deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib \
# 		  \n deb-src http://mirrors.163.com/debian/ jessie main non-free contrib \
# 		  \n deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib \
# 		  \n deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib \
# 		  \n deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib \
# 		  \n deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib \
# 		  ' \
# 	> /etc/apt/sources.list


RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		wget \
		git \
		xz-utils \
		unzip \
	&& rm -rf /var/lib/apt/lists/*


#===================
# Add a non-root user with UID=1000
#===================adduser user && \
RUN useradd -ms /bin/bash 'uid1000'