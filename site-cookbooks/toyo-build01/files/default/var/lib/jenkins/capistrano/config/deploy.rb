# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'takasing'
set :repo_url, 'git@github.com:TOTEC2014/takasing.git'
set :deploy_to, '/var/www/takasing'
set :scm, :git
set :branch, 'master'

set :log_level, :info
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :default_env, { path: "$PATH" }
set :deploy_via, :copy

set :rbenv_type, :system
set :rbenv_ruby, '2.1.3'

set :user, "jenkins"
#set :use_sudo, true

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
# set :format, :pretty
# set :pty, true
# set :linked_files, %w{config/database.yml}
# set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
