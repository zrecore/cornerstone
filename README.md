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


## How do I work with this?

### Run this Vagrant provision

You will need to install Virtualbox and Vagrant on your machine.

Before provisioning this Vagrant box

**EDIT THE DEFAULT MONGODB USER AND PASSWORD in `vmscripts/vm.setup.server.sh`**

This Vagrant box runs on your machine at [192.168.33.11](192.168.33.11). 

Append an entry to your `/etc/hosts` file to give it a local domain name:

```
192.168.33.11    local.your-site.com
```

Change `local.your-site.com` to whatever URL you want locally.

### Modify features


Updates to the core are made via push requests and releases (github). 
DO NOT modify the core directly, as changes will be overwritten by future updates!


Instead, include your own module with appropriate event hooks. This allows you to override or supplement the default behaviours of your web application.

