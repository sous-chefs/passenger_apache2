default[:passenger][:install_method] = 'source'

default[:passenger][:source][:version]     = "3.0.11"
default[:passenger][:source][:root_path]   = "#{languages[:ruby][:gems_dir]}/gems/passenger-#{passenger[:version]}"
default[:passenger][:source][:module_path] = "#{passenger[:source][:root_path]}/ext/apache2/mod_passenger.so"
default[:passenger][:source][:apache_mpm]  = 'prefork'
default[:passenger][:max_pool_size] = "6"
default[:passenger][:packages] = []
