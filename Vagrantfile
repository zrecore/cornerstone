# -*- mode: ruby -*-
# vi: set ft=ruby :


require_relative 'setup/config.rb'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|






  config.vm.define :cornerstoneapp do |t|
    t.ssh.username = LINODE_SSH_USERNAME
    t.ssh.private_key_path = LINODE_SSH_PRIVATE_KEY_PATH

    t.vm.provider :linode do |provider, override|
      override.vm.box = 'ubuntu/bionic64'
      # override.vm.box_url = 'https://github.com/displague/vagrant-linode/raw/master/box/linode.box'
      provider.api_key = LINODE_API_KEY

      provider.distribution = 'Ubuntu 18.04 LTS'
      provider.datacenter = 'fremont'
      provider.plan = 'Nanode 1GB'
      provider.label = 'Cornerstone'
    end

    t.vm.network "forwarded_port", guest: 80, host: 80 # Serve from frontend /dist folder!
    t.vm.network "forwarded_port", guest: 443, host: 443 # Enable on production

    t.vm.synced_folder "./app", "/home/#{LINODE_SSH_USERNAME}/app", exclude: ["cornerstone-ui/node_modules", "cornerstone-ui/dist"]
    t.vm.synced_folder "./setup", "/home/#{LINODE_SSH_USERNAME}/setup"
    t.vm.synced_folder "./vmscripts", "/home/#{LINODE_SSH_USERNAME}/vmscripts"
    t.vm.synced_folder ".", "/vagrant", disabled: true

    # t.vm.provision "shell", path: "vmscripts/vm.setup.all.sh", privileged: true, env: {"ENV" => "PROD", "USER" => LINODE_SSH_USERNAME}
    t.vm.provision "shell", path: "vmscripts/vm.setup.server.sh", privileged: false, env: {"ENV" => "production", "USER" => LINODE_SSH_USERNAME}
    t.vm.provision "shell", path: "vmscripts/vm.install.letsencryptssl.sh", privileged: false, env: {"ENV" => "production", "USER" => LINODE_SSH_USERNAME}
    t.vm.provision "shell", path: "vmscripts/vm.setup.node.sh", privileged: false, env: {"ENV" => "production", "USER" => LINODE_SSH_USERNAME}
    t.vm.provision "shell", path: "vmscripts/vm.setup.mean-stack.sh", privileged: false, env: {"ENV" => "production", "USER" => LINODE_SSH_USERNAME}
    t.vm.provision "shell", path: "vmscripts/vm.setup.letsencryptssl.sh", privileged: false, env: {"ENV" => "production", "USER" => LINODE_SSH_USERNAME}

    t.vm.provision "shell", path: "vmscripts/vm.setup.linode.sh", privileged: false, env: {"ENV" => "production", "USER" => LINODE_SSH_USERNAME}
    
  end

  config.vm.define :cornerstonelocal do |local|

    local.vm.box = "ubuntu/bionic64"

    local.vm.network "forwarded_port", guest: 27017, host: 27017
    local.vm.network "forwarded_port", guest: 4200, host: 4200 # Change to port 80 on production (Front-End)
    local.vm.network "forwarded_port", guest: 4000, host: 4000
    # config.vm.network "forwarded_port", guest: 443, host: 443 # Enable on production
    local.vm.network "forwarded_port", guest: 49152, host: 49152

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    local.vm.network "private_network", ip: "192.168.33.10"

    local.vm.synced_folder "./app", "/home/vagrant/app", fsnotify: true, exclude: ["cornerstone-ui/node_modules", "cornerstone-ui/dist"]
    local.vm.synced_folder "./setup", "/home/vagrant/setup"
    local.vm.synced_folder "./vmscripts", "/home/vagrant/vmscripts"
    local.vm.synced_folder ".", "/vagrant", disabled: true

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    local.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
      vb.memory = "1024"
    end
    
    local.vm.provision "shell", path: "vmscripts/vm.setup.server.sh", privileged: false
    local.vm.provision "shell", path: "vmscripts/vm.setup.node.sh", privileged: false
    local.vm.provision "shell", path: "vmscripts/vm.setup.mean-stack.sh", privileged: false
    
  end
end
