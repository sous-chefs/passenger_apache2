name              'passenger_apache2'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache 2.0'
description       'Installs passenger for Apache2'
version           '2.2.3'

recipe 'passenger_apache2', 'Installs Passenger as an Apache module'
recipe 'passenger_apache2::mod_rails', 'Enables Apache module configuration for passenger module'

depends 'apache2', '~> 1.0'
depends 'build-essential'

%w{ redhat centos scientific amazon oracle ubuntu debian arch }.each do |os|
  supports os
end
