#
# Cookbook Name:: passenger_apache2
# Attributes:: default
#
# Copyright 2009-2015, Chef Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['passenger']['install_method'] = 'source'

default['passenger']['version']     = '4.0.53'
default['passenger']['apache_mpm']  = nil
default['passenger']['bin_dir'] = nil
default['passenger']['root_path']   = "#{languages['ruby']['gems_dir']}/gems/passenger-#{passenger['version']}"
default['passenger']['module_path'] = "#{passenger['root_path']}/#{Chef::Recipe::PassengerConfig.build_directory_for_version(passenger['version'])}/apache2/mod_passenger.so"
default['passenger']['max_pool_size'] = 6
default['passenger']['manage_module_conf'] = true
default['passenger']['package']['name'] = nil
# set package version to nil, the distro package may not be the same version
default['passenger']['package']['version'] = nil
default['passenger']['ruby_bin'] = languages['ruby']['ruby_bin']
default['passenger']['install_module'] = true
