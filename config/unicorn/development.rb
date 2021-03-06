app_path = "./"
working_directory "#{app_path}"

worker_processes 1

# FIXME
pid "#{app_path}/tmp/pids/unicorn.pid"

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{working_directory}/Gemfile"
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
