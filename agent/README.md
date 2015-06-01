# Docker TeamCity Agent

[TeamCity](https://www.jetbrains.com/teamcity) Build Agent Docker Container

## Starting the container

Before starting the agent, ensure that you have a TeamCity build server instance reachable in your network.
Otherwise the agent won't be much useful. If you don't know how to start, this 
[TeamCity Docker container](https://registry.hub.docker.com/u/alonsodomin/teamcity-server/) could be a good
starting point.

### Connecting the agent to a build server running in another container

The following command will start a TeamCity build agent instance:

```
docker run -d --name some_teamcity-agent --link some_teamcity:teamcity alonsodomin/teamcity-agent
```

### Connecting the agent to a build server running anywhere else

By defining the same environment variables that the agent container looks for when starting we can tell it how
to find the build server:

```
docker run -d --name some_teamcity-agent -e TEAMCITY_PORT_8111_TCP_ADDR=<teamcity_address> -e TEAMCITY_PORT_8111_TCP_PORT=<teamcity_port> alonsodomin/teamcity-agent
```

### Custom configuration

We can also provide the agent with our custom-made configuration file in which we can configure the URL that will
be used to connect with the build server, among other things. An 
[example](https://github.com/alonsodomin/docker-teamcity/blob/master/test/agent/buildAgent.properties)
configuration file can be found in the source repository.

We must place a file like the above example in a folder inside our machine, then mount that folder as a volume
in the Docker container:

```
docker run -d --name some_teamcity-agent -v /path/to/my/conf:/etc/teamcity-agent alonsodomin/teamcity-agent
```

