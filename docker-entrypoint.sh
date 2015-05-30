#!/bin/sh

CMD=""

case "$1" in
    start-agent)
        CMD="$TEAMCITY_HOME/buildAgent/bin/agent.sh start"
        ;;
    stop-agent)
        CMD="$TEAMCITY_HOME/buildAgent/bin/agent.sh stop"
        ;;
    *)
        CMD="$TEAMCITY_HOME/bin/runAll.sh"
esac

exec $CMD