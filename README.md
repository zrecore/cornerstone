# cornerstone
Cor·ner·stone /ˈkôrnərˌstōn/, noun - an important quality or feature on which a particular thing depends or is based.


## Build web applications faster

This is a web application starter project.

Build a MEAN stack web application quickly. Includes the following:

 * Strongloop, Loopback (REST API back-end, shared data models)
 * Angular 7, Twitter Bootstrap (Front-end)

## How do I work with this?

Copy `setup/sample.config.sh` as `setup/local.config.sh`, and edit the `local.config.sh` file with your own values. You may also create `production.config.sh` with production mode values.

If you plan on deployting to Linode, copy `setup/sample.config.rb` to `setup/config.rb` and edit the values.

You may create your own shell scripts in `vmscripts/` and have modify the `Vagrantfile` script to suit your needs.

### Run this Vagrant provision

You will need to install Virtualbox and Vagrant on your machine.

Please install the following vagrant plug-ins:

 * vagrant-fsnotify - forwards file system change events to the VM.
 * vagrant-linode - for Linode deployment.
 * vagrant-vbguest - Keeps the VM guest additions up to date on your VM boxes.

Before provisioning this Vagrant box

This Vagrant box runs on your machine at [192.168.33.11](192.168.33.11)

Append an entry to your `/etc/hosts` file to give it a local domain name:

```
192.168.33.11    cornerstone.test
```

Change `cornerstone.test` to whatever URL you want locally.

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

### Run the front-end

Open up another shell terminal, navigate to the `cornerstone/` directory, and run:

```
vagrant ssh
```

Then change directories to `/home/ubuntu/app/cornerstone-ui` and run:

```
npm start
```

The front-end is now available at [cornerstone.test:4200](cornerstone.test:4200)


### Run the front-end (production)

To build the front-end into a distributable set of files, run the following command instead:

```
npm build
```

If you would like to use SSR (Server-Side Rendering), use `npm run build:ssr` to build, and `npm run serve:ssr` to serve. See `setup/sample.start.sh` to see a sample shell script you can have run on boot to always have SSR served.

To add a cron job at boot, run `crontab -e`, add the following

```
@reboot /usr/bin/screen -d -m /home/ubuntu/app/cornerstone-ui/start.sh
```

Replace `ubuntu` with the system user's home directory if it's not `ubuntu`.