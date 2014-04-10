# -*- encoding: utf-8 -*-
require File.expand_path('../lib/boomerang/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Tom Ward']
  gem.email         = ['tom@popdog.net']
  gem.summary       = %q{Redirection helpers for rails}
  gem.description   = %q{Redirect away from an action and come back later}
  gem.homepage      = ''

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'boomerang-rails'
  gem.require_paths = ['lib']
  gem.version       = Boomerang::VERSION
  gem.add_dependency 'rails', '>3.0'
  gem.add_development_dependency 'rake', '~>0.9.2.2'
  gem.add_development_dependency 'rspec-rails', '~>2.7.0'
  gem.add_development_dependency 'mocha'
end
