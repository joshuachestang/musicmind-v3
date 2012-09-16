set :application, "musicmind"
set :repository,  "https://github.com/joshuachestang/musicmind-v3.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "musicmind11.db.7988723.hostedresource.com"                          # Your HTTP server, Apache/etc
role :app, "musicmind11.db.7988723.hostedresource.com"                          # This may be the same as your `Web` server
role :db,  "musicmind11.db.7988723.hostedresource.com", :primary => true # This is where Rails migrations will run
role :db,  "musicmind11.db.7988723.hostedresource.com"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end