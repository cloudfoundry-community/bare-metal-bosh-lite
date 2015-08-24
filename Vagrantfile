# Set default variables
# bail if no server IP or ssh key

manifest = ENV["MANIFEST"] || "bare-metal.yml.example"

abort("No SERVER_IP specified, cannot continue") unless ENV["SERVER_IP"]
abort("No SSH_KEY specified, cannot continue") unless ENV["SSH_KEY"]

Vagrant.configure('2') do |config|
  config.vm.box = 'cloudfoundry/bosh-lite'

  config.vm.provider :managed do |managed, override|
    managed.server = ENV["SERVER_IP"]
    override.vm.box = "tknerr/managed-server-dummy"
    override.ssh.username = "vcap"
    override.ssh.private_key_path = ENV["SSH_KEY"]
  end

 config.vm.provision "bosh" do |c|
   # use cat or just inline full deployment manifest
   c.manifest = `cat #{manifest}`
 end
end
