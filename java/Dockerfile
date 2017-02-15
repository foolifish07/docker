FROM foolifish07/base

# Author
MAINTAINER foolifish07 <foolifish07@gmail.com>

# Oracle-JDK-8
ENV JAVA_HOME /opt/java
ARG ORACLE_JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz

ENV PATH ${JAVA_HOME}/bin:$PATH
RUN mkdir -p $JAVA_HOME \
 	&& wget --header "Cookie: oraclelicense=accept-securebackup-cookie" $ORACLE_JAVA_URL -qO - \
		| tar -xzC $JAVA_HOME --strip-components=1 \
 	&& java -version


# Maven
ARG MAVEN_VERSION=3.3.9
ARG MAVEN_HOME=/opt/maven

RUN mkdir -p $MAVEN_HOME $MAVEN_REGISTRY \
 && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC $MAVEN_HOME --strip-components=1 \
 && ln -s $MAVEN_HOME/bin/mvn /usr/local/bin/mvn \
 && whereis mvn

# change mirrors
COPY ./settings.xml $MAVEN_HOME/conf/settings.xml

