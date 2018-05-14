#
# Cookbook:: passenger_apache2
# Recipe:: source
# Copyright:: 2009-2017, Chef Software, Inc
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

build_essential 'install compilation tools'

node.default['passenger']['apache_mpm'] = 'prefork'

case node['platform_family']
when 'arch'
  package 'apache'
when 'rhel', 'fedora'
  package 'httpd-devel'
  if node['platform_version'].to_i < 6
    package 'curl-devel'
  else
    package %w(libcurl-devel openssl-devel zlib-devel)
  end
when 'suse'
  package %w(apache2-devel curl-devel openssl-devel zlib-devel)
when 'debian'
  if %w( worker threaded ).include? node['passenger']['apache_mpm']
    package 'apache2-threaded-dev'
  elsif node['platform'] == 'ubuntu' && node['platform_version'].to_f >= 16.04
    package 'apache2-dev'
  else
    package 'apache2-prefork-dev'
  end

  package %w(libssl-dev zlib1g-dev libapr1-dev libcurl4-gnutls-dev)
end

gem_package 'passenger' do
  version node['passenger']['version']
  gem_binary "#{node['passenger']['bin_dir']}/gem" unless node['passenger']['bin_dir'].nil?
end

execute 'passenger_module' do
  command "#{node['passenger']['ruby_bin']} #{node['passenger']['root_path']}/bin/passenger-install-apache2-module _#{node['passenger']['version']}_ --auto"
  only_if { node['passenger']['install_module'] }
  # this is late eval'd when Chef converges this resource, and the
  # attribute may have been modified by the `mod_rails` recipe.
  not_if { ::File.exist?(node['passenger']['module_path']) }
end
