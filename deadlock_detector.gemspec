# -*- encoding: utf-8 -*-
require File.expand_path('../lib/deadlock_detector/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Steven Ringo"]
  gem.email         = ["steven@stevenringo.com"]
  gem.description   = %q{Deadlock detection exercise}
  gem.summary       = %q{Deadlock detection exercise}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "deadlock_detector"
  gem.require_paths = ["lib"]
  gem.version       = DeadlockDetector::VERSION
  
  gem.add_development_dependency 'rspec', '~> 2.10'
end
