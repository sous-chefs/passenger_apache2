#
# Cookbook Name:: passenger_apache2
# Recipe:: source_rvm
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

include_recipe 'passenger_apache2::source_dependencies'

rvm_gem 'passenger' do
  ruby_string node['passenger']['rvm_ruby_string']
  version node['passenger']['version']
end

rvm_shell 'passenger_module' do
  code "passenger-install-apache2-module _#{node['passenger']['version']}_ --auto"
  creates node['passenger']['module_path']
  only_if { node['passenger']['install_module'] }
  ruby_string node['passenger']['rvm_ruby_string']
end
