# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/nginx/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-nginx"
  spec.version       = Rspec::Nginx::VERSION
  spec.authors       = ["Andy Triggs"]
  spec.email         = ["andy.triggs@gmail.com"]
  spec.description   = %q{Use TDD to build your NginX config files feature by feature, or write regression tests to help you refactor your config-monsters.}
  spec.summary       = %q{A framework for testing NginX config files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
