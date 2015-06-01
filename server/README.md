# Docker TeamCity Server

[TeamCity](https://www.jetbrains.com/teamcity) Build Server Docker Container

## Starting the container

The following command will start a TeamCity server instance without any build agent.

```
docker run -d --name some_teamcity alonsodomin/teamcity-server
```

## Build agents

To have a complete Continuous Integration environment you will need some build agents connected to the previous
instance. The [TeamCity Build Agent Container](https://registry.hub.docker.com/u/alonsodomin/teamcity-agent/)
could help you getting the full CI environment you are looking for.

## Build Server configuration

The default setup of the container doesn't assume any kind of specifics when regarding the installation configuration.
TeamCity allows the user to input any specifics during the first startup with the help of an UI.

By following those steps any user can get a running TeamCity instance ready in a few minutes. In order to make the
configuration permanent it is recommended to mount as an external volume the folder in which any of those
configuration settings will be placed when following all the steps.

Start the container with following command to mount the configuration folder as an external volume:

```
docker run -d --name some_teamcity -v /path/to/my/conf:/var/lib/teamcity alonsodomin/teamcity-server
```