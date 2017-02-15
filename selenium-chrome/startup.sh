#!/bin/bash

#========
# Create a virtual monitor
#========
nohup Xvfb :1 -screen 0 1024x768x16 &> xvfb.log  &

# <hostname>:<display>.<monitor>
: ${DISPLAY:=:1.0}
export DISPLAY

exec ${@}