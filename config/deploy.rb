require 'bundler/capistrano'

default_run_options[:pty] = false
ssh_options[:forward_agent] = true
set :use_sudo, false
set :user, "moggsterrthree"

set :application, "rthree.moggster.com"
set :repository,  "git@github.com:moggsterb/rthree.moggster.com.git"
set :scm, :git
set :branch, 'master'
set :git_shallow_clone, 1
set :deploy_via, :remote_cache
set :copy_compression, :bz2
set :rails_env, 'production'
set :deploy_to, "/home/moggsterrthree/#{application}"

role :web, "#{application}"                          # Your HTTP server, Apache/etc
role :app, "#{application}"                          # This may be the same as your `Web` server
role :db,  "#{application}", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end







