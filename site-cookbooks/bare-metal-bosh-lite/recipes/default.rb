#
# Cookbook Name:: bare-metal-bosh-lite
# Recipe:: default
#

user 'vagrant' do
  action :nothing
end.run_action(:create)

ip = node['ipaddress']
%w[80 443 4443].each do |port| 
  iptables_ng_rule "web-#{port}" do
    ip_version 4
    chain 'PREROUTING'
    table 'nat'
    rule "-p tcp -d #{ip} --dport #{port} -j DNAT --to 10.244.0.34:#{port}"
  end
end




