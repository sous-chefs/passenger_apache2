# passenger_apache2 Cookbook CHANGELOG

This file is used to list changes made in each version of the passenger_apache2 cookbook.

## 3.1.0 (2018-05-14)

- Cookstyle fix
- Remove maintainer files
- Enable all Foodcritic rules
- Use build_essential resource vs. recipe

## 3.0.1 (2017-04-27)
- Fix attributes to work with Chef 13

## 3.0.0 (2016-09-16)
- Default to 4.0.60
- Fix compatibility with Ubuntu 16.04
- correct documentation for using cookbook's default web_app.conf template
- add example of specifying where to get web app template from
- Testing updates
- Avoid node.set and instead use node.normal
- Use multipackage installs to speed up installs
- Require Chef 12.1

## v2.3.1 (2016-03-29)

- Install Passenger using the correct Gem binary by adding default['passenger']['bin_dir'] and default['passenger']['bin']
- Properly notify Apache2 to reload when configs change in mod_rails
- Add known issues to the Readme
- Run integration tests in Travis CI using Kitchen Docker
- Add long_description to the metadata
- Add basic converge coverage with ChefSpec
- Update testing dependencies and resolve new Rubocop warnings
- Remove incorrect build-essential dependency listed in the readme

## v2.3.0 (2015-09-23)

- Update Apache 2 requirement from 1.X.X to >= 2.0.0 which adds support for current Ubuntu and CentOS releases
- The minimum supported Chef release is now 11.0
- Added support for Fedora and openSUSE / SLES
- Update source recipe to not upgrade packages.  Package upgrades should be done outside community cookbooks and not randomly during Chef runs.
- Add chef standard gitignore and chefignore files
- Add a .foodcritic file to exclude rules that aren't valid for this cookbook
- Update Kitchen CI config for new platforms and format
- Add Rubocop config
- Add Travis CI config
- Update Berksfile to 3.X format and remove Yum, which wasn't actually used
- Update Contributing, Testing, and Maintainers docs
- Add Rakefile for simplified testing
- Update Gemfile with updated testing and development gems
- Replace all references to Opscode with Chef Software
- Add Travis CI and cookbook version badges to the Readme

## v2.2.3 (2014-12-07)

- Fix idempotence check to check for existence of the right file, at the right time (#34, #37, #42)
- Constrain apache2 cookbook version (#32, #33)
- Update passenger version to latest bugfix release (4.0.53)

## v2.2.2 (2014-08-25)

- COOK-4666 Include attribute conditional check to install module

## v2.2.0 (2014-02-21)

### Bug

- **[COOK-4081](https://tickets.opscode.com/browse/COOK-4081)** - Install command does not use correct attribute

### Improvement

- **[COOK-4005](https://tickets.opscode.com/browse/COOK-4005)** - Make the passenger apache module installation step use optional custom ruby when building from source

## v2.1.4

### Improvement

- [COOK-4005] Make the passenger apache module installation use optional custom ruby when building from source

## v2.1.2

### Bug

- [COOK-3706] Fix permission of passenger.load
- [COOK-3747] Call full path for installing module

## v2.1.0

### Bug

- **[COOK-3654](https://tickets.opscode.com/browse/COOK-3654)** - Fix compatibility with Chef 11
- **[COOK-3395](https://tickets.opscode.com/browse/COOK-3395)** - Fix an issue where the recipe does not compile the version of passenger specified on the node attribute

### Improvement

- **[COOK-3486](https://tickets.opscode.com/browse/COOK-3486)** - Make `PassengerRuby` configurable

## v2.0.4

### Bug

- **[COOK-2293](https://tickets.opscode.com/browse/COOK-2293)** - Automatically reload Ohai attribtues

## v2.0.2

### Bug

- [COOK-2750]: using `mod_rails` in `run_list` by itself fails in version 2.0.0
- [COOK-2972]: `passenger_apache2` has foodcritic errors
- [COOK-3180]: don't use `mod_rails` recipe w/ package install

## v2.0.0

[COOK-2115] - Improve `passenger_apache2` cookbook source [COOK-2128] - Allow apache passenger to be installed via packages [COOK-2203] - Remove :source key from `module_path` [COOK-2379] - `passenger_apache2` should install passenger 3.0.19 [COOK-2380] - `pasenger_apache2` should use `platform_family` for additional platform support

## v1.1.0

- [COOK-2003] - only able to use apache2-prefork-dev to compile passenger

## v1.0.0

- [COOK-1097] - documentation missing for mod_rails recipe
- [COOK-1132] - example doesn't work
- [COOK-1133] - update to passenger v3.0.11

## v0.99.4

- [COOK-958] - fix regression for loadmodule on debian/ubuntu
- [COOK-1003] - support archlinux

## v0.99.2

- [COOK-859] - don't hardcode module path
- [COOK-539] - use --auto for installation
- [COOK-608] - remove RailsAllowModRewrite from web_app.erb
- [COOK-640] - use correct development headers on RHEL

## v0.99.0

- Upgrade to passenger 3.0.7
- Attributes are all "default"
- Install curl development headers
- Move PassengerMaxPoolSize to config of module instead of vhost.
