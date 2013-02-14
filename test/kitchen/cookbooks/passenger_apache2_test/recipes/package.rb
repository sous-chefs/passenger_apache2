#
# Cookbook Name:: passenger_apache2_test
# Recipe:: package
#
# Copyright 2013, Opscode, Inc.
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

node.set['passenger']['install_method'] = 'package'
node.set['passenger']['package'].delete('version')

node.set['passenger']['package']['name'] = case node['platform_family']
                                           when 'debian'
                                             'libapache2-mod-passenger'
                                           when 'rhel'
                                             'mod_passenger'
                                           end

include_recipe "passenger_apache2::default"
