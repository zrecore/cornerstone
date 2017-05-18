# cornerstone
Cor·ner·stone /ˈkôrnərˌstōn/, noun - an important quality or feature on which a particular thing depends or is based.


## Build shops faster

This is a web application starter project.

Build a MEAN stack web application quickly. Includes the following:

 * Strongloop, Loopback (REST API back-end, shared data models)
 * MySQL (Database)
 * Angular2, Twitter Bootstrap (Front-end)

The following features are included:

 * eCommerce shop
 * Subscriptions, Service system
 * Payment Gateway integration - PayPal, Stripe, Recurly
 * CMS (Content Management System) - Includes micro formatting, SEO, and Social Engagement features.
 * Sales/Site analytics
 * Client account system

The UX/UI uses proper motion/animation techniques. It is built on top of the Twitter Bootstrap framework (Sass/SCSS), and leverages the power of Angular for the front-end logic.


## How do I work with this?

### Run this Vagrant provision

You will need to install Virtualbox and Vagrant on your machine.

Before provisioning this Vagrant box

**EDIT THE DEFAULT MONGODB USER AND PASSWORD in `vmscripts/vm.setup.server.sh`**

This Vagrant box runs on your machine at [192.168.33.11](192.168.33.11)

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

Then change directories to `/home/ubuntu/app/cornerstone-frontend` and run:

```
npm start
```

The front-end is now available at [local.cornerstone.com:4200](local.cornerstone.com:4200)

To build the front-end into a distributable set of files, run the following command instead:

```
npm build
```

### Modify features


Updates to the core are made via push requests and releases (github). 
DO NOT modify the core directly, as changes will be overwritten by future updates!


Instead, include your own module with appropriate event hooks. This allows you to override or supplement the default behaviours of your web application.

