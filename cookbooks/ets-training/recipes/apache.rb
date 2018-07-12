#
# Cookbook:: ets-training
# Recipe:: apache tomcat
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# install tomcat
yum_package 'tomcat' do
  action :install
end

# put sample war file into webapps folder
remote_file '/usr/share/tomcat/webapps/sample.war' do
  source 'http://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# start tomcat
service 'tomcat' do
  action [:enable, :start]
end
