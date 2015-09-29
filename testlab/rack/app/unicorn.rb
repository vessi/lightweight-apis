listen "/tmp/unicorn.sock", backlog: 64 # by default Unicorn listens on port 8080
worker_processes 4 # this should be >= nr_cpus
pid "/tmp/unicorn.pid"
stderr_path "/dev/stdout"
stdout_path "/dev/stdout"
