#
# Cookbook:: ets-training
# Recipe:: haproxy
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute 'yum' do
  command 'yum update -y'
  action :run
end

package 'haproxy' do
  action :install
end

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  variables(backend_nodes: search(:node, 'chef_environment:_default')
  .sort_by(&:name))
  notifies :reload, 'service[haproxy]'
end

service 'haproxy' do
  supports restart: true, status: true, reload: true
  action %i[enable start]
end
