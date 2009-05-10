default_run_options[:pty] = true

# be sure to change these
set :user, 'rails'
set :domain, 'shiftrefresh.net'
set :application, 'seinfeld'

# the rest should be good
set :repository,  "git@github.com:tedkulp/#{application}.git" 
set :deploy_to, "/var/www/shiftrefresh.net/seinfeld" 
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

# desc "Link in the production database.yml and link to http credentials" 
# task :after_update_code do
#   run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml" 
#   run "ln -nfs #{deploy_to}/#{shared_dir}/lib/http_auth.rb #{release_path}/lib/http_auth.rb" 
# end

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end
