FROM foolifish07/base

RUN apt-get update && apt-get install -y --no-install-recommends \
		firefox-esr \
 && rm -rf /var/lib/apt/lists/*

# ENV DISPLAY=:0
VOLUME ["/tmp/.X11-unix"]

CMD ["firefox"]