FROM java:8-jre

MAINTAINER Antonio Alonso Dominguez "alonso@codenibbles.com"

ENV TEAMCITY_VERSION 9.1.7
ENV TEAMCITY_HOME /opt/lib/teamcity
ENV TEAMCITY_DATA_PATH /var/lib/teamcity

RUN mkdir -p /opt/lib && \
    mkdir -p /var/lib/teamcity && \
    wget -nv http://download.jetbrains.com/teamcity/TeamCity-$TEAMCITY_VERSION.tar.gz -O /TeamCity-$TEAMCITY_VERSION.tar.gz && \
    tar zxf /TeamCity-$TEAMCITY_VERSION.tar.gz -C /opt/lib && \
    rm -f /TeamCity-$TEAMCITY_VERSION.tar.gz && \
    mv /opt/lib/TeamCity $TEAMCITY_HOME && \
    rm -fr $TEAMCITY_HOME/buildAgent

VOLUME [ "/var/lib/teamcity" ]

WORKDIR /opt/lib/teamcity

EXPOSE 8111

ENTRYPOINT [ "/opt/lib/teamcity/bin/teamcity-server.sh", "run" ]
