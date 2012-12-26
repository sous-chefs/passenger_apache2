default[:passenger][:install_method] = 'source'

default[:passenger][:version]     = "3.0.11"
default[:passenger][:source][:apache_mpm]  = 'prefork'
default[:passenger][:root_path]   = "#{languages[:ruby][:gems_dir]}/gems/passenger-#{passenger[:version]}"
default[:passenger][:module_path] = "#{passenger[:source][:root_path]}/ext/apache2/mod_passenger.so"
default[:passenger][:max_pool_size] = 6
default[:passenger][:manage_module_conf] = true
default[:passenger][:package][:name] = nil
default[:passenger][:package][:version] = passenger[:version]
