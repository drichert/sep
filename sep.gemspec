# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sep/version'

Gem::Specification.new do |gem|
  gem.name          = "sep"
  gem.version       = Sep::VERSION
  gem.authors       = ["Dan Richert"]
  gem.email         = ["dan.richert@gmail.com"]
  gem.description   = %q{Separates strings and puts them back together}
  gem.summary       = %q{Separate and reassemble strings based on whitespace}
  gem.homepage      = "https://github.com/drichert/sep"

  gem.add_dependency("rake")

  gem.add_development_dependency("rspec")

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
