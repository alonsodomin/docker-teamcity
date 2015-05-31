FROM java:8-jdk

MAINTAINER Antonio Alonso Dominguez "alonso@codenibbles.com"

ENV TEAMCITY_VERSION 9.0.4
ENV TEAMCITY_AGENT_HOME /opt/lib/teamcity-agent

RUN mkdir -p /opt/lib && \
    mkdir -p /etc/teamcity-agent && \
    wget -nv http://download.jetbrains.com/teamcity/TeamCity-$TEAMCITY_VERSION.war -O /tmp/TeamCity-$TEAMCITY_VERSION.war && \
    unzip -qq /tmp/TeamCity-$TEAMCITY_VERSION.war -d /tmp/teamcity && \
    unzip -qq /tmp/teamcity/update/buildAgent.zip -d $TEAMCITY_AGENT_HOME && \
    chmod +x $TEAMCITY_AGENT_HOME/bin/*.sh && \
    rm -fr $TEAMCITY_AGENT_HOME/conf && \
    ln -s /etc/teamcity-agent $TEAMCITY_AGENT_HOME/conf && \
    rm -fR /tmp/*

COPY conf/* /etc/teamcity-agent/

EXPOSE 9090

VOLUME [ "/etc/teamcity-agent" ]

CMD [ "/opt/lib/teamcity-agent/bin/agent.sh", "run" ]