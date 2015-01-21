require 'bundler/gem_tasks'

desc 'CypherBuilder included console'
task :console do
  require 'pry'
  require 'cypher_builder'
  ARGV.clear
  include CypherBuilder
  Pry.start
end

