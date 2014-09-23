#
# Cookbook Name:: rbenv-ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

include_recipe "rbenv::rbenv_vars"

rbenv_ruby "2.1.3" do
  global true
end

%w(bundler pry).each do |gem|
  rbenv_gem gem do
    ruby_version $RUBY_VERSION
  end
end
