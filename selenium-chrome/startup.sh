#!/bin/bash

#===========================
# Create a virtual monitor
#===========================
# nohup Xvfb :1 -screen 0 1024x768x16 > /dev/null 2>&1 &
supervisord -c /tmp/supervisor.xvfb.conf

# <hostname>:<display>.<monitor>
: ${DISPLAY:=:1.0}
export DISPLAY

exec ${@}