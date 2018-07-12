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

template '/etc/default/haproxy' do
  source 'haproxy-default.erb'
  owner 'root'
    group 'root'
  mode 0644
end

service 'haproxy' do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, 'service[haproxy]'
end
