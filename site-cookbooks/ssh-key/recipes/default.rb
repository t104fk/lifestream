#
# Cookbook Name:: jenkins-key
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
ssh_user = "ec2-user"
ssh_group = "ec2-user"
ssh_dir = "/home/ec2-user/.ssh"
key_name = "id_rsa"
private_key = File.join(ssh_dir, key_name)
directory ssh_dir do
  owner ssh_user
  group ssh_group
  mode 0700
  not_if { File.exist? ssh_dir }
end
execute "generate ssh key for deploy" do
  user ssh_user
  creates private_key
  command "ssh-keygen -t rsa -q -P '' -C '#{ssh_user}@#{key_name}' -f #{private_key}"
end
