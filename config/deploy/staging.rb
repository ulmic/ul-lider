server 'new.ul-lider.ru', user: 'lider', roles: %w{web app db}

set :application, 'lider_v2_stg'
set :deploy_to, '/srv/lider_v2_stg'
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"
set :rails_env, :staging
set :branch, "develop"
