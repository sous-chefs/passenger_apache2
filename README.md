# passenger_apache2 Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/passenger_apache2.svg)](https://supermarket.chef.io/cookbooks/passenger_apache2)
[![Build Status](https://img.shields.io/circleci/project/github/sous-chefs/passenger_apache2/master.svg)](https://circleci.com/gh/sous-chefs/passenger_apache2)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Installs Phusion Passenger Ruby application server for Apache 2.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

- Debian/Ubuntu
- RHEL/CentOS/Scientific/Amazon/Oracle
- Fedora
- openSUSE/SLES

### Chef

- Chef 14+

### Cookbooks

- apache2 >= 2.0.0

## Attributes

- `node['passenger']['version']` - Specify the version of passenger to install.
- `node['passenger']['max_pool_size']` - Sets PassengerMaxPoolSize in the Apache module config.
- `node['passenger']['root_path']` - The location of the passenger gem.
- `node['passenger']['ruby_bin']` - Sets PassengerRuby in the Apache module config and is used for passenger module configuration. Defaults to `node['languages']['ruby']['ruby_bin']`.
- `node['passenger']['module_path']` - The location of the compiled passenger apache module.
- `node['passenger']['install_method']` - Includes the "source" (gem install) or "package" recipe. Default "source."
- `node['passenger']['apache_mpm']` - Override with an "override_attribute" (in a role, environment or with node.override) to "worker" or "threaded" to use apache2-threaded-dev package. Otherwise this assumes prefork.
- `node['passenger']['package']['name']` - Name of the package for passenger, default is nil, so this must be set before using the "package" install method/recipe.
- `node['passenger']['install_module']` - Specify the boolean value which decides installing Passenger. Defaults to true, and setting to false skips the installation
- `node['passenger']['package']['version']` - Specify the version of the passenger package to install. Uses `version` attribute above by default. To install the version available by default (latest, usually), delete the attribute in a recipe with this line:

  ```ruby
  node.normal['passenger']['package'].delete('version')
  ```

## Recipes

### default

Installs passenger from gem (source) or package depending on the value of the `install_method` attribute.

### mod_rails

Installs the passenger gem and enables the module in Apache2.

### source

Installs passenger as a RubyGem.

### package

Installs passenger as a Package.

Set the `install_method` attribute to package, then set the `package['name']` attribute to the correct package for your platform. The recipe does not yet handle adding yum repositories for RHEL platforms, so that should be done in another recipe until COOK-2414 is resolved.

Set the `node['passenger']['package']['version']` attribute to the correct value for your system's available package repository if necessary. By default the value is nil which will install the latest package version from the distribution package manager.

## Usage

For example, to run a Rails application on passenger:

```ruby
include_recipe "rails"
include_recipe "passenger_apache2"

web_app "myproj" do
  docroot "/srv/myproj/public"
  server_name "myproj.#{node[:domain]}"
  server_aliases [ "myproj", node[:hostname] ]
  rails_env "production"
end
```

A sample config template is provided, `web_app.conf.erb`. If this is suitable for your application, add 'cookbook "passenger_apache2"' to the define above to use that template. Otherwise, copy the template to the cookbook where you're using `web_app`, and modify as needed. The cookbook parameter is optional, if omitted it will search the cookbook where the define is used.

Example:

```ruby
web_app "myproj" do
  # ...
  cookbook "passenger_apache2"
  # ...
end
```

## Known Issues

When run as a daemonized process under init on linux, using <https://github.com/opscode-cookbooks/chef-client/blob/master/recipes/init_service.rb> for example, the /sbin/service script scrubs the environment, including the HOME environment variable. In some versions, Passenger depends on the HOME environment variable to be present. This can be worked around by setting the necessary environment variables directly in your recipes.

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
