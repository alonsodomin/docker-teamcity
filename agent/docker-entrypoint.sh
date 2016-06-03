#!/bin/sh

if [ ! -z "$TEAMCITY_PORT_8111_TCP_ADDR" ] && [ ! -z "$TEAMCITY_PORT_8111_TCP_PORT" ]; then
  sed -i "s/<teamcity_server>/"${TEAMCITY_PORT_8111_TCP_ADDR}"/" /etc/teamcity-agent/buildAgent.properties
  sed -i "s/<teamcity_port>/"$TEAMCITY_PORT_8111_TCP_PORT"/" /etc/teamcity-agent/buildAgent.properties
fi

exec "$TEAMCITY_AGENT_HOME/bin/agent.sh" run
