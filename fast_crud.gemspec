# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fast_crud/version'

Gem::Specification.new do |spec|
  spec.name          = "fast_crud"
  spec.version       = '0.1.13'
  spec.authors       = ["lou"]
  spec.email         = ["louguenier@gmail.com"]

  spec.summary       = "fast_crud is a superclass that will design the basic implementation of CRUD controller"
  spec.homepage      = "http://github.com/lguenier/fast_crud"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
