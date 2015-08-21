# Bosh-lite on bare-metal with knife solo

This guide assumes you have already installed [Ubuntu Server 12.04 LTS (64-bit)](http://releases.ubuntu.com/12.04.4/) or later on your box.
And have correctly configured passwordless ssh access to the `vcap` user with passwordless sudo.

1. Configure the manifest + vagrant file for your environment, and install the necessary vagrant plugins/bosh cli:

```
export SERVER_IP=<ip of your box>
export SSH_KEY=<path to ssh key for the vcap user>
./configure
```

**Additional Options:*
This has been tested with BOSH version 196, and Warden CPI version 21, but
you can look at these pages and specify newer versions if desired with the `BOSH_VERSION`
and `WARDEN_CPI_VERSION` variables:

* http://bosh.io/releases/github.com/cloudfoundry/bosh
* http://bosh.io/releases/github.com/cppforlife/bosh-warden-cpi-release


2. Verify access to the box:

```
vagrant up
```

3. Provision:

```
vagrant provision
```

If all goes well, that should do it!
