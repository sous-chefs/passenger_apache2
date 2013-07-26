class Chef::Recipe::PassengerConfig

  # This function takes a version string and returns the name of the directory
  # containing the build artifacts for that version.
  #
  # Prior to version 3.9.1.beta, passenger put build artifacts into
  # a directory called 'ext'
  # From version 3.9.1.beta through version 4.0.5, the build artifacts
  # were put in 'libout'.
  # Since then, build artifacts are in 'buildout'
  def build_directory_for_version(version)
    # some passenger version strings have an additional, 4th part (.beta/rcX) which
    # would break our comparison. So consider only first 3 parts of version.
    # All versions: http://rubygems.org/gems/passenger/versions
    version = version.split('.')[0,3].join('.')
    if Chef::VersionConstraint.new('> 4.0.5').include?(version)
      'buildout'
    elsif Chef::VersionConstraint.new('>= 3.9.0').include?(version)
      'libout'
    else
      'ext'
    end
  end

  def self.build_directory_for_version(version)
    new.build_directory_for_version(version)
  end
end
