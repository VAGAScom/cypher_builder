# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cypher_builder/version'

Gem::Specification.new do |spec|
  spec.name          = 'cypher_builder'
  spec.version       = CypherBuilder::VERSION
  spec.authors       = ['Ronie Uliana']
  spec.email         = ['ronie.uliana@gmail.com']
  spec.summary       = %q{Build Cypher query classes (Neo4j).}
  spec.description   = %q{Build Cypher query classes (Neo4j).}
  spec.homepage      = 'https://github.com/ruliana/cypher_builder'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.3'
  spec.add_development_dependency 'neography', '~> 1.6'
end
