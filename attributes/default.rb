default['passenger']['version']         = '3.0.11'
default['passenger']['max_pool_size']   = '6'
default['passenger']['root_path']       = "#{default['languages']['ruby']['gems_dir']}/gems/passenger-#{default['passenger']['version']}"
default['passenger']['module_path']     = "#{default['passenger']['root_path']}/ext/apache2/mod_passenger.so"
default['passenger']['apache_mpm']      = 'prefork'
