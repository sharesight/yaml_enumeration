# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaml_enumeration/version'

Gem::Specification.new do |spec|
  spec.name          = "yaml_enumeration"
  spec.version       = YamlEnumeration::VERSION
  spec.authors       = ["Thorsten Boettger"]
  spec.email         = ["boettger@mt7.de"]

  spec.summary       = %q{Create ActiveRecord enumerations based on YAML files.}
  spec.description   = %q{Create ActiveRecord enumerations based on YAML files.}
  spec.homepage      = "https://github.com/alto/yaml_enumeration"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "shoulda-context"

  spec.add_dependency "activesupport"
  spec.add_dependency "railties"
end
