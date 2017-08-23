# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  
  # @TODO Replace "cornerstoneapp" with your application name

  config.vm.define :cornerstoneapp do |t|
    #t.ssh.username = 'YOUR_USER_NAME'
    #t.ssh.private_key_path = '~/.ssh/YOUR_PRIVATE_KEY'

    t.vm.provider :linode do |provider, override|
      override.vm.box = 'linode'
      override.vm.box_url = 'https://github.com/displague/vagrant-linode/raw/master/box/linode.box'
      #provider.token = 'YOUR_LINODE_API_TOKEN'

      provider.distribution = 'Ubuntu 16.04 LTS'
      provider.datacenter = 'fremont'
      provider.plan = '2048'
      #provider.label = 'YOUR_CUSTOM_LABEL'
    end

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # config.vm.network "forwarded_port", guest: 80, host: 8080
    #config.vm.network "forwarded_port", guest: 27017, host: 27017 # MongoDB client app (to browse/edit)
    t.vm.network "forwarded_port", guest: 8701, host: 8701 # Strongloop Loopback REST API Explorer
    #config.vm.network "forwarded_port", guest: 4200, host: 4200 # Change to port 80 on production (Front-End)
    t.vm.network "forwarded_port", guest: 80, host: 80 # Serve from frontend /dist folder!
    t.vm.network "forwarded_port", guest: 443, host: 443 # Enable on production
    t.vm.network "forwarded_port", guest: 3000, host: 3000 # Strongloop Loopback REST Server
    #config.vm.network "forwarded_port", guest: 49152, host: 49152 # Live Reload, disable in Production.

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # config.vm.network "private_network", ip: "192.168.33.10"
    #config.vm.network "private_network", ip: "192.168.33.13"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"
    t.vm.synced_folder "./app", "/home/ubuntu/app"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    ###t.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
      ### vb.memory = "4096" #"1024"
    ###end
    #
    # View the documentation for the provider you are using for more
    # information on available options.

    # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
    # such as FTP and Heroku are also available. See the documentation at
    # https://docs.vagrantup.com/v2/push/atlas.html for more information.
    # config.push.define "atlas" do |push|
    #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
    # end

    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.

    # EDIT THE app/cornerstone-backend/setup/config.sh FILE! It contains your mongoDB credentials!
    #############################################
    #### DO NOT LEAVE password as 'password' ####
    #############################################

    # Priviledged user, Setup the server packages
    t.vm.provision "shell", path: "vmscripts/vm.setup.server.sh"
    # Priviledged user, adds/installs LetsEncrypt certbot package (SSL certificate installer/updater)
    t.vm.provision "shell", path: "vmscripts/vm.install.letsencryptssl.sh"
    # Non-priviledged user, installs node packages.
    t.vm.provision "shell", path: "vmscripts/vm.setup.mean-stack.sh", privileged: false
    # Non-priviledged user, installs LetsEncrypt SSL cert installer.
    t.vm.provision "shell", path: "vmscripts/vm.setup.letsencryptssl.sh", privileged: false

    # Setup Linode provision
    t.vm.provision "shell", path: "vmscripts/vm.setup.linode.sh"
    
    # Setup StrongLoop backend
    t.vm.provision "shell", path: "vmscripts/vm.setup.strongloop.sh", privileged: false
    t.vm.provision "shell", path: "vmscripts/vm.setup.strongloop-pm.sh" # Run this on production for the strongloop-pm service
  end

  config.vm.define :cornerstonelocal do |local|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.

    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://atlas.hashicorp.com/search.
    local.vm.box = "ubuntu/xenial64"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # config.vm.network "forwarded_port", guest: 80, host: 8080
    local.vm.network "forwarded_port", guest: 27017, host: 27017
    local.vm.network "forwarded_port", guest: 8701, host: 8701 # Strongloop Loopback REST API Explorer
    local.vm.network "forwarded_port", guest: 4200, host: 4200 # Change to port 80 on production (Front-End)
    local.vm.network "forwarded_port", guest: 4000, host: 4000
    # config.vm.network "forwarded_port", guest: 443, host: 443 # Enable on production
    local.vm.network "forwarded_port", guest: 3000, host: 3000 # Strongloop Loopback REST Server
    local.vm.network "forwarded_port", guest: 49152, host: 49152

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    local.vm.network "private_network", ip: "192.168.33.11"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"
    local.vm.synced_folder "./app", "/home/ubuntu/app"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    local.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
      vb.memory = "4096" #"1024"
    end
    #
    # View the documentation for the provider you are using for more
    # information on available options.

    # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
    # such as FTP and Heroku are also available. See the documentation at
    # https://docs.vagrantup.com/v2/push/atlas.html for more information.
    # config.push.define "atlas" do |push|
    #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
    # end

    # Enable provisioning with a shell script. Additional provisioners such as
    # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
    # documentation for more information about their specific syntax and use.

    # EDIT THE app/cornerstone-backend/setup/config.sh FILE! It contains your mongoDB credentials!
    #############################################
    #### DO NOT LEAVE password as 'password' ####
    #############################################
    local.vm.provision "shell", path: "vmscripts/vm.setup.server.sh"
    # Non-priviledged user, installs node packages.
    local.vm.provision "shell", path: "vmscripts/vm.setup.mean-stack.sh", privileged: false
    # Setup StrongLoop backend
    local.vm.provision "shell", path: "vmscripts/vm.setup.strongloop.sh", privileged: false
    
  end
end
