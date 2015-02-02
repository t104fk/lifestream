#
# Cookbook Name:: jenkins-key
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
jenkins_user = "jenkins"
jenkins_group = "jenkins"
ssh_dir = "/var/lib/jenkins/.ssh"
key_name = "deploy_key"
private_key = File.join(ssh_dir, "deploy_key")
directory ssh_dir do
  owner jenkins_user
  group jenkins_group
  mode 0700
  not_if { File.exist? ssh_dir }
end
execute "generate ssh key for deploy" do
  user jenkins_user
  creates private_key
  command "ssh-keygen -t rsa -q -P '' -C '#{jenkins_user}@#{key_name}' -f #{private_key}"
end
