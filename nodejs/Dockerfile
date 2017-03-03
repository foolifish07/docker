FROM foolifish07/base

# Author
MAINTAINER foolifish07 <foolifish07@gmail.com>

# Refer: https://hub.docker.com/_/node/

#=================
# Config
#=================
ARG NODE_VERSION=6.9.5
ARG NODE_HOME=/opt/node
ARG DOWNLOAD_URL=https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz
# # For regions in china: "https://npm.taobao.org/mirrors/node"
# ARG DOWNLOAD_URL=https://npm.taobao.org/mirrors/node/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz

# Environment pah
ENV PATH=$NODE_HOME/bin:$PATH
RUN mkdir -p ${NODE_HOME} \
 && curl -SL ${DOWNLOAD_URL} \
    | tar -xJC ${NODE_HOME} --strip-components=1 \
 && node -v

# change registry for china region
# RUN npm config set registry https://registry.npm.taobao.org

COPY ./startup.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh
ENTRYPOINT ["/tmp/startup.sh"]
CMD ["node"]