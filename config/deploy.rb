# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'cleanpixe'
set :repo_url, 'git@github.com:alucardu/cleanpixel.git'

set :deploy_to, '/home/deploy/cleanpixel'

set :linked_files, %w{config/database.yml secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}


# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  namespace :assets do
   desc "Precompile assets locally and then rsync to deploy server"
    task :precompile, :only => { :primary => true } do
      run_locally "bundle exec rake assets:precompile"
      servers = find_servers :roles => [:app], :except => { :no_release => true }
      servers.each do |server|
        run_locally "rsync -av ./public/#{assets_prefix}/ #{user}@#{server}:#{current_path}/public/#{assets_prefix}/"
      end
      run_locally "rm -rf public/#{assets_prefix}"
    end
  end
end