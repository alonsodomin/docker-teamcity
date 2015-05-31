# Docker TeamCity

TeamCity Docker Container

## Starting the container

The following command will start a TeamCity server instance without any build agent.

```
docker run -d --name some_teamcity alonsodomin/teamcity
```

## Build Server and agents

You can use Docker Compose to bring up an instance of the build server and as many agents as you'd like (or your
license allows you).

This can be done very easily using a `docker-compose.yml` file like the following:

```yaml
server:
  image: alonsodomin/teamcity-server
  ports:
    - 8111:8111
agent-01:
  image: alonsodomin/teamcity-agent
  ports:
    - 9090:9090
  volumes:
    - ./agent:/etc/teamcity-agent
  links:
    - server
agent-02:
  image: alonsodomin/teamcity-agent
  ports:
    - 9191:9090
  volumes:
    - ./agent:/etc/teamcity-agent
  links:
    - server
```