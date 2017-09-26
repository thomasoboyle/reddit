lock '3.2.1'

# application name
set :application, 'reddit'

# deploy directory on the server. Will be ie: '/var/www/myapp_production'
set :deploy_to, -> { "/var/www/#{fetch(:application)}_#{fetch(:stage)}" }

# capistrano will download an app from "master" branch of this repository:
set :repo_url, 'git@github.com:ashleyelder/reddit.git'

# change to ruby version you need
set :rbenv_ruby, '2.4.1p111'
