# Development settings

# working_directory "/vagrant"
# pid "/vagrant/tmp/pids/unicorn.pid"
# stderr_path "/vagrant/log/unicorn.log"
# stdout_path "/vagrant/log/unicorn.log"

# listen "/tmp/unicorn.todo.sock"
# worker_processes 2
# timeout 30


# Production settings

root = "/home/deployer/apps/hexguru/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.hexguru.sock"
worker_processes 2
timeout 30