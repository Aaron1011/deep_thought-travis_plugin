# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deep_thought-travis_plugin/version'

Gem::Specification.new do |gem|
  gem.name          = "deep_thought-travis_plugin"
  gem.version       = DeepThought::VERSION
  gem.authors       = ["Aaron Hill"]
  gem.email         = ["aa1ronham@gmail.com"]
  gem.description   = "Deep Thought CI service for Travis CI."
  gem.summary       = "Deep Thought CI service for Travis cI."
  gem.homepage      = "https://github.com/Aaron1011/deep_thought-travis_plugin"

  gem.files         = `git ls-files`.split("\n") - %w[.gitignore]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "deep_thought", "~>0.2"
  gem.add_dependency "httparty", "~>0.12"

  # # testing
  gem.add_development_dependency "minitest", "~>4.7"
  gem.add_development_dependency "mocha", "~>0.14"
  gem.add_development_dependency "database_cleaner", "~>1.2"
  gem.add_development_dependency "turn", "~>0.9"
end
