# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bower_vendor/version'

Gem::Specification.new do |spec|
  spec.name          = "bower_vendor"
  spec.version       = BowerVendor::VERSION
  spec.authors       = ["kari"]
  spec.email         = ["mr.kari.ikonen@gmail.com"]
  spec.summary       = 'Use bower to manage resources for rails application'
  spec.description   = 'Manage vendor assets using simple configuration file'
  spec.homepage      = "https://github.com/kikonen/bower_vendor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

#  spec.add_development_dependency "awesome_print"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
end
