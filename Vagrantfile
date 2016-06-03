# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

def require_plugin(plugin_name)
  unless Vagrant.has_plugin?(plugin_name)
    puts "ERROR: Missing plugin '#{plugin_name}'"
    puts "Please run: vagrant plugin install #{plugin_name}"
    exit(1)
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  require_plugin("vagrant-docker-compose")

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "teamcity-vagrant"

  # fix "stdin: is not a tty" error
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.network "private_network", ip: "192.168.100.11"

  require_plugin("vagrant-hostmanager")
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision :docker
  config.vm.provision :shell, path: "test/download_mysql_driver.sh"
  config.vm.provision :docker_compose, yml: "/vagrant/test/docker-compose.yml", rebuild: true

end
