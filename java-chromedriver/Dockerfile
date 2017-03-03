FROM foolifish07/java


#=========
# chrome
#=========
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
 && apt-get update \
 && apt-get install -y google-chrome-stable \
 && rm -rf /var/lib/apt/lists/* \
 && rm /etc/apt/sources.list.d/google-chrome.list \
 && whereis google-chrome-stable


#==============
# chromedriver
#==============
ARG DRIVER_HOME=/opt/drivers
ARG CHROME_DRIVER_VERSION=2.27
ARG URL=https://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip

RUN mkdir -p ${DRIVER_HOME} \
 && wget $URL -qO tmp.zip \
 && unzip -od ${DRIVER_HOME} tmp.zip \
 && rm tmp.zip

ENV SELENIUM_WEB_DRIVER_CHROME_HOME ${DRIVER_HOME}


#=============
# xvfb
#+============
RUN apt-get update && apt-get install -y --no-install-recommends \
	x11vnc \
	xvfb \
	fluxbox \
	xterm \
 && rm -rf /var/cache/* /var/log/apt/* /tmp/* 


#=======================
# python && supervisor
#=======================
RUN apt-get update && apt-get install -y --no-install-recommends \
	python \
 && rm -rf /var/cache/* /var/log/apt/* /tmp/*

RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python \
 && pip --version \
 && pip install supervisor

# change maven logger
COPY ./simplelogger.properties /opt/maven/conf/logging/simplelogger.properties

COPY ./supervisor.xvfb.conf /tmp/supervisor.xvfb.conf
COPY ./startup.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh
ENTRYPOINT ["/tmp/startup.sh"]