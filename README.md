# cornerstone
Cor·ner·stone /ˈkôrnərˌstōn/, noun - an important quality or feature on which a particular thing depends or is based.


## Build web applications faster

This is a web application starter project.

Build a MEAN stack web application quickly. Includes the following:

 * Strongloop, Loopback (REST API back-end, shared data models)
 * MySQL (Database)
 * Angular5, Twitter Bootstrap (Front-end)

## How do I work with this?

Copy `app/cornerstone-backend/setup/sample.config.sh` as `app/cornerstone-backend/setup/config.sh`, and edit the `config.sh` file with your own values.

### Run this Vagrant provision

You will need to install Virtualbox and Vagrant on your machine.

Please install the following vagrant plug-ins:

 * vagrant-fsnotify - forwards file system change events to the VM.
 * vagrant-linode - for Linode deployment (See Vagrantfile!)
 * vagrant-vbguest - Keeps the VM guest additions up to date on your VM boxes.

Before provisioning this Vagrant box

**EDIT THE DEFAULT MONGODB USER AND PASSWORD in `app/cornerstone-backend/setup/config.sh`**

This Vagrant box runs on your machine at [192.168.33.10](192.168.33.10)

Append an entry to your `/etc/hosts` file to give it a local domain name:

```
192.168.33.11    local.cornerstone.com
```

Change `local.cornerstone.com` to whatever URL you want locally.

Now, open up a shell, navigate to the `cornerstone/` directory, and run:

```
vagrant up
```

The first time you run this command, the Vagrant provision will download and configure all necessary components into one self-contained Virtual Machine (VM).

To shutdown your provisioned VM, issue the following command:

```
vagrant halt
```

To start it back up, just issue the `vagrant up` command again.

To see the status of your VM, issue the `vagrant status` command.

### Run the back-end

Open up a shell terminal, navigate to the `cornerstone/` directory, and run:

```
vagrant ssh
```

Then change directories to `/home/ubuntu/app/cornerstone-backend` and run:

```
node .
```

The back-end server is now available at [local.cornerstone.com:3000](local.cornerstone.com:3000)

### Run the front-end

Open up another shell terminal, navigate to the `cornerstone/` directory, and run:

```
vagrant ssh
```

Then change directories to `/home/ubuntu/app/cornerstone-ui` and run:

```
npm start
```

The front-end is now available at [local.cornerstone.com:4000](local.cornerstone.com:4200)

To build the front-end into a distributable set of files, run the following command instead:

```
npm build
```
