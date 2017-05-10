# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-mayun/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-mayun"
  spec.version       = Omniauth::Mayun::VERSION
  spec.authors       = ["Zoker"]
  spec.email         = ["kaixuanguiqu@gmail.com"]
  spec.description   = %q{Oauth2 for git.oschina.net}
  spec.summary       = %q{Oauth2 for git.oschina.net}
  spec.homepage      = "https://git.oschina.net"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
