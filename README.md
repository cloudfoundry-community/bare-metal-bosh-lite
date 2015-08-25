# Bosh-lite on bare-metal with knife solo

This guide assumes you have already installed [Ubuntu Server 12.04 LTS (64-bit)](http://releases.ubuntu.com/12.04.4/) or later on your box.
And have correctly configured passwordless ssh access to the `vcap` user with passwordless sudo.

### Getting Started - The Quick Way

1. Install preqrequisites:

```
./install-prereqs
```

2. Export the required environment variables:
```
export SERVER_IP=<ip of your box>
export SSH_KEY=<path to ssh key for the vcap user>
```

3. Ensure you can communicate to your server with vagrant:

`vagrant up`

4. Provision the box:

`vagrant provision`

If all goes well, you should have a bosh-lite instance running on bare metal in a matter of minutes!

### Customizing your BOSH/Warden setup:

1. Install prerequisites:

```
./install-prereqs
```

2. Copy the example manifest to name of your choosing, and edit it to make your changes:

```
cp bare-metal.yml.example my-manifest.yml
vi my-manifest.yml
```

3. Export the required environment variables:
```
export SERVER_IP=<ip of your box>
export SSH_KEY=<path to ssh key for the vcap user>
export MANIFEST=my-manifest.yml
```

4. Ensure you can communicate to your server with vagrant:

`vagrant up`

5. Provision the box:

`vagrant provision`
