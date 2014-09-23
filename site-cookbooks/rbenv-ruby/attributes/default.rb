default[:rbenv][:user] = "ec2-user"
default[:rbenv][:user_home] = "/home/#{node[:rbenv][:user]}"
default[:rbenv][:group] = "ec2-user"
default[:rbenv][:git_revision] = "master"
default[:ruby_build][:git_revision] = "master"

