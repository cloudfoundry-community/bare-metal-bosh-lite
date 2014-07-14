#
# Cookbook Name:: bare-metal-bosh-lite
# Recipe:: default
#

# Make sure the vagrant user is created before the bosh-lite recipes.
user 'vagrant' do
  action :nothing
end.run_action(:create)


cookbook_file "/etc/network/interfaces" do
  notifies :run, 'execute[restart-network]'
end

# xip.io is not supported by all dns server use google to be save
ruby_block "setup-google-dns" do
  block do
    line = "supersede domain-name-servers 8.8.8.8, 8.8.4.4;"
    file = Chef::Util::FileEdit.new("/etc/dhcp/dhclient.conf")
    file.insert_line_if_no_match(/#{line}/, line)
    file.write_file
  end
  action :create
  notifies :run, 'execute[restart-network]'
end

execute "restart-network" do
  command "ifdown -a && ifup -a"
  action :nothing
end
