name              'passenger_apache2'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache-2.0'
description       'Installs Passenger for Apache2'
chef_version '>= 14.0'
version '4.0.6'

depends 'apache2', '>= 7.1'

%w( fedora redhat centos scientific amazon oracle ubuntu debian arch suse ).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/passenger_apache2'
issues_url 'https://github.com/chef-cookbooks/passenger_apache2/issues'
