#
# Cookbook Name:: bare-metal-bosh-lite
# Recipe:: default
#

# Make sure the vagrant user is created before the bosh-lite recipes.
user 'vagrant' do
  action :nothing
end.run_action(:create)

# %w[default forward prerouting].each do |chain|
#   iptables_ng_chain "warden-#{chain}"
# end


# ip = node['ipaddress']
# %w[80 443 4443].each do |port| 
#   iptables_ng_rule "web-#{port}" do
#     ip_version 4
#     chain 'PREROUTING'
#     table 'nat'
#     rule "-p tcp -d #{ip} --dport #{port} -j DNAT --to 10.244.0.34:#{port}"
#   end
# end

# xip.io is not supported by all dns server use google to be save
ruby_block "setup-google-dns" do
  block do
    line = "supersede domain-name-servers 8.8.8.8, 8.8.4.4;"
    file = Chef::Util::FileEdit.new("/etc/dhcp/dhclient.conf")
    file.insert_line_if_no_match(/#{line}/, line)
    file.write_file
  end
  action :create
  notifies :run, 'execute[apply-dns]'
end

execute "apply-dns" do
  command "ifdown eth0 && ifup eth0"
  action :nothing
end
