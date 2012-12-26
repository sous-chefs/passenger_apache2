unless(node[:passenger][:package][:name])
  raise 'Passenger package name must be defined!'
end

package node[:passenger][:package][:name] do
  version node[:passenger][:package][:version]
end
