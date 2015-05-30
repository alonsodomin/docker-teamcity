# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puphpet/centos65-x64"

  # fix "stdin: is not a tty" error
  #config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.network "private_network", ip: "192.168.100.11"

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision :docker do |d|
    d.build_image "/vagrant", args: "-t alonsodomin/teamcity"
    d.run "teamcity",
          image: "alonsodomin/teamcity",
          args: "-p 8111:8111"
  end
  
end
