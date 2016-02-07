# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nbb/version'

Gem::Specification.new do |spec|
  spec.name          = 'nbb'
  spec.version       = Nbb::VERSION
  spec.authors       = ['Ivan Malykh']
  spec.email         = ['ivan@lesslines.com']

  spec.summary       = 'Ruby wrapper for Dutch Basketball Association JSON API'
  spec.description   = 'This Ruby gems wraps Nederlandse Basketbal Bond (NBB) JSON API'
  spec.homepage      = 'https://github.com/ivdma/nbb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency 'httparty',                  '~> 0.13'
  spec.add_dependency 'activesupport',             '~> 4.2'

  spec.add_development_dependency 'bundler',       '~> 1.11'
  spec.add_development_dependency 'rake',          '~> 10.0'
  spec.add_development_dependency 'rspec',         '~> 3.4'
  spec.add_development_dependency 'guard-rspec',   '~> 4.6'
  spec.add_development_dependency 'guard-bundler', '~> 2.1'
  spec.add_development_dependency 'webmock',       '~> 1.22'
  spec.add_development_dependency 'vcr',           '~> 3.0'
  spec.add_development_dependency 'pry',           '~> 0.10'
  spec.add_development_dependency 'rubocop',       '~> 0.37'
  spec.add_development_dependency 'guard-rubocop', '~> 1.2'
  spec.add_development_dependency 'fabrication',   '~> 2.14'
end
