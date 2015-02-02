#
# Cookbook Name:: toyo-build01
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
packages = [{name: "capistrano", version: "3.2.1"},
  {name: "capistrano-rbenv", version: "2.0.2"},
  {name: "capistrano-bundler", version: "1.1.2"},
  {name: "capistrano-rails", version: "1.1.1"}]
packages.each do |package|
  gem_package package[:name] do
    action :install
    version package[:version]
    options("-N")
  end
end

remote_directory '/var/lib/jenkins/capistrano' do
  source 'var/lib/jenkins/capistrano'
  owner 'ec2-user'
  group 'ec2-user'
  mode 0755
  action :create
end

directory '/var/lib/jenkins/.ssh' do
  owner 'jenkins'
  group 'jenkins'
  mode 0700
  action :create
end

cookbook_file '/var/lib/jenkins/.ssh/config' do
  source 'var/lib/jenkins/.ssh/config'
  owner 'jenkins'
  group 'jenkins'
  mode 0644
  action :create
end

