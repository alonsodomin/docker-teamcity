#!/bin/sh

CMD=""

case "$1" in
    start-agent)
        CMD="$TEAMCITY_HOME/buildAgent/bin/agent.sh start"
        ;;
    stop-agent)
        CMD="$TEAMCITY_HOME/buildAgent/bin/agent.sh stop"
        ;;
    start)
        CMD="$TEAMCITY_HOME/bin/runAll.sh start"
        ;;
    stop)
        CMD="$TEAMCITY_HOME/bin/runAll.sh stop force"
        ;;
    *)
        echo "Invalid command: $1"
        echo "Valid commands are: [ start | stop | start-agent | stop-agent ]"
esac

exec $CMD