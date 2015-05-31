FROM java:8-jre

MAINTAINER Antonio Alonso Dominguez "alonso@codenibbles.com"

ENV TEAMCITY_VERSION 9.0.4
ENV TEAMCITY_HOME /opt/lib/teamcity
ENV TEAMCITY_DATA_PATH /var/lib/teamcity

RUN mkdir -p /opt/lib && \
    mkdir -p /var/lib/teamcity && \
    mkdir -p /etc/teamcity && \
    wget -nv http://download.jetbrains.com/teamcity/TeamCity-$TEAMCITY_VERSION.tar.gz -O /TeamCity-$TEAMCITY_VERSION.tar.gz && \
    tar zxf /TeamCity-$TEAMCITY_VERSION.tar.gz -C /opt/lib && \
    rm -f /TeamCity-$TEAMCITY_VERSION.tar.gz && \
    mv /opt/lib/TeamCity $TEAMCITY_HOME && \
    rm -fr $TEAMCITY_HOME/buildAgent

ENV MYSQL_CONNECTOR_VERSION 5.1.35

RUN mkdir -p $TEAMCITY_DATA_PATH/lib/jdbc && \
    wget -nv http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.tar.gz -O /tmp/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.tar.gz && \
    tar zxf /tmp/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.tar.gz -C /tmp && \
    cp /tmp/mysql-connector-java-$MYSQL_CONNECTOR_VERSION/mysql-connector-java-$MYSQL_CONNECTOR_VERSION-bin.jar $TEAMCITY_DATA_PATH/lib/jdbc && \
    rm -fR /tmp/*

COPY conf/* /etc/teamcity/
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME [ "/etc/teamcity", "/var/lib/teamcity" ]

EXPOSE 8111

CMD [ "/opt/lib/teamcity/bin/teamcity-server.sh", "run" ]
