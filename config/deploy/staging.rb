server '178.62.23.211', user: 'yvision_staging', roles: %w{web app db}

set :rails_env, :staging
set :branch, "staging"
