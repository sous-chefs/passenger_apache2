name              'passenger_apache2'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache-2.0'
description       'Installs Passenger for Apache2'
version '3.1.0'

depends 'apache2', '>= 7.1'

%w( fedora redhat centos scientific amazon oracle ubuntu debian arch suse ).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/passenger_apache2'
issues_url 'https://github.com/chef-cookbooks/passenger_apache2/issues'

chef_version '>= 14.0'
