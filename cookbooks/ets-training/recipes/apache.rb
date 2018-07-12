#
# Cookbook:: ets-training
# Recipe:: apache tomcat
#
# Copyright:: 2018, The Authors, All Rights Reserved.

yum_package 'wget' do
  action :install
end

yum_package 'tomcat' do
  action :install
end

execute 'wget' do
  command 'wget http://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war -O /tmp/sample.war'
  action :run
end

service 'tomcat' do
  action :start
end

