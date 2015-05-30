FROM java:8

MAINTAINER Antonio Alonso Dominguez "alonso@codenibbles.com"

ENV TEAMCITY_VERSION 9.0.4
ENV TEAMCITY_HOME /opt/lib/teamcity

RUN mkdir -p /opt/lib && \
    wget -nv http://download.jetbrains.com/teamcity/TeamCity-$TEAMCITY_VERSION.tar.gz -O /TeamCity-$TEAMCITY_VERSION.tar.gz && \
    tar zxf /TeamCity-$TEAMCITY_VERSION.tar.gz -C /opt/lib && \
    rm -f /TeamCity-$TEAMCITY_VERSION.tar.gz && \
    mv /opt/lib/TeamCity $TEAMCITY_HOME

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8111

ENTRYPOINT [ "/docker-entrypoint.sh" ]
