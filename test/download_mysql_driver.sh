#!/usr/bin/env bash

MYSQL_CONNECTOR_VERSION=5.1.35

function download_driver() {
    echo "Downloading MYSQL Java Driver..."

    if [ -d /var/lib/teamcity/lib/jdbc ]; then
        rm -f /var/lib/teamcity/lib/jdbc/mysql-*.jar
    else
        mkdir -p /var/lib/teamcity/lib/jdbc
    fi

    wget -nv http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.tar.gz \
         -O /tmp/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.tar.gz
    tar zxf /tmp/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.tar.gz -C /tmp
    cp /tmp/mysql-connector-java-$MYSQL_CONNECTOR_VERSION/mysql-connector-java-$MYSQL_CONNECTOR_VERSION-bin.jar /var/lib/teamcity/lib/jdbc
    rm -fR /tmp/*
}

test -f /var/lib/teamcity/lib/jdbc/mysql-connector-java-$MYSQL_CONNECTOR_VERSION-bin.jar || download_driver
