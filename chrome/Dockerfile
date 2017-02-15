FROM foolifish07/base

# Author
MAINTAINER foolifish07 <foolifish07@gmail.com>

#===================
# download chrome
#===================
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
 && apt-get update \
 && apt-get install -y google-chrome-stable \
 && rm -rf /var/lib/apt/lists/* \
 && rm /etc/apt/sources.list.d/google-chrome.list \
 && whereis google-chrome-stable

# ENV DISPLAY=:0
VOLUME ["/tmp/.X11-unix"]

USER uid1000

CMD ["google-chrome"]