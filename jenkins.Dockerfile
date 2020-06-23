FROM jenkins/jenkins:alpine
MAINTAINER Olivier O. <olivierots@hotmail.com>

USER root

ENV TZ Europe/London

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
EXPOSE 8080

USER jenkins
