# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'angerfist/version'

Gem::Specification.new do |spec|
  spec.name          = 'angerfist'
  spec.version       = Angerfist::VERSION
  spec.authors       = ['pikesley']
  spec.email         = ['tech@openaddressesuk.org']
  spec.summary       = %q{Rack middleware for Google Analytics tracking server-side}
  spec.description   = %q{Rack middleware for Google Analytics tracking server-side}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rack', '~> 1.6'
  spec.add_dependency 'gabba', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'pry', '~> 0.10'
end
