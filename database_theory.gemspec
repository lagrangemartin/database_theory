# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'database_theory/version'

Gem::Specification.new do |spec|
  spec.name          = "database_theory"
  spec.version       = DatabaseTheory::VERSION
  spec.authors       = ["Martin Lagrange"]
  spec.email         = ["lagrangemartin@gmail.com"]
  spec.summary       = %q{Provides some useful tools from the database theory}
  spec.description   = %q{provides some useful tools from the database theory}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rdoc"

  spec.add_dependency "activesupport"
  spec.add_dependency "ruby-graphviz"

end
