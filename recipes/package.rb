unless(node[:passenger][:package][:name])
  raise 'Passenger package name must be defined!'
end

if(node[:passenger][:apache_mpm])
  Chef::Log.warn 'Attribute `node[:passenger][:apache_mpm]` is not effective in package based installs'
end

package node[:passenger][:package][:name] do
  version node[:passenger][:package][:version]
end
