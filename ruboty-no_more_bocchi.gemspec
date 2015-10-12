# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/no_more_bocchi/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-no_more_bocchi"
  spec.version       = Ruboty::NoMoreBocchi::VERSION
  spec.authors       = ["akira.takahashi"]
  spec.email         = ["rike422@gmail.com"]
  spec.summary       = %q{very simple grouping tool}
  spec.description   = %q{very simple grouping tool}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ruboty"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
