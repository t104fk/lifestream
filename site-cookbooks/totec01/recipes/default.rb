#
# Cookbook Name:: totec01
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory '/var/www/totec-app' do
  owner 'totec2014'
  group 'totec2014'
  mode 0755
  action :create
end
