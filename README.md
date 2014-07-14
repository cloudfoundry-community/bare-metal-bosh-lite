# Bosh-lite on bare-metal with knife solo

This guide assumes you have already installed [Ubuntu Server 12.04 LTS (64-bit)](http://releases.ubuntu.com/12.04.4/) on your box.
And have correctly configured ssh access.

1. Prepare you box by installing chef

```
STATIC_IP=<ip of your box>
knife solo prepare root@$STATIC_IP
```

2. Edit the created node file

```
cp nodes/example_node.json nodes/$STATIC_IP.json
```

3. Install bosh-lite

```
knife solo cook root@$STATIC_IP
```
