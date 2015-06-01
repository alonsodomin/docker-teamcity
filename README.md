# Docker TeamCity

The following repository provides with the necessary sources to build a Docker image for the TeamCity build server
and its build agents.

## Starting the containers

The following command will start a TeamCity server instance without any build agent:

```
docker run -d --name some_teamcity alonsodomin/teamcity-server
```

Meanwhile, starting a build agent is as simple as with the server:

```
docker run -d --name some_teamcity-agent --link some_teamcity:teamcity alonsodomin/teamcity-agent
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
agent:
  image: alonsodomin/teamcity-agent
  ports:
    - 9090:9090
  volumes:
    - /opt/etc/teamcity-agent:/etc/teamcity-agent
  links:
    - server:teamcity
```

## Testing environment
 
The source repository comes with a [Vagrant](http://www.vagrantup.com) configuration to setup a virtual machine in 
which a MySQL database, the TeamCity build server and one build agent will be composed using 
[Docker Compose](https://docs.docker.com/compose/).

The container composition is done during the Vagrant provisioning phase by means of the 
[Vagrant Docker Compose](https://github.com/leighmcculloch/vagrant-docker-compose) plugin. So before attempting to
bring the Vagrant VM up, ensure that you have the plugin installed locally:

```
vagrant plugin install vagrant-docker-compose
```

Now you can start the VM and test the docker containers running inside it:

```
vagrant up
```
