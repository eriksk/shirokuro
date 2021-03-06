# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shirokuro/version'

Gem::Specification.new do |spec|
  spec.name          = "shirokuro"
  spec.version       = SK::VERSION
  spec.authors       = ["erikskogl"]
  spec.email         = ["erikskoglund88@gmail.com"]
  spec.summary       = "Gosu helper lib"
  spec.description   = "Gosu helper lib"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "gosu"
  spec.add_dependency "chipmunk"
  spec.add_dependency "ruby-opengl"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
end
