require 'cypher_builder/version'

module CypherBuilder
  module Adapter
  end
end

require 'cypher_builder/adapter/neography'
require 'neography' rescue nil
if defined?(::Neography)
  CypherBuilder::Adapter::DEFAULT = CypherBuilder::Adapter::Neography.new
end

require 'cypher_builder/infra/payload'
require 'cypher_builder/infra/context'
require 'cypher_builder/infra/resolver'
require 'cypher_builder/infra/runner'

# Not in Cypher
require 'cypher_builder/cypher'
require 'cypher_builder/as_is'
require 'cypher_builder/opt'

# Cypher
require 'cypher_builder/field'
require 'cypher_builder/node'
require 'cypher_builder/rel'
require 'cypher_builder/param'
require 'cypher_builder/literal'
require 'cypher_builder/match'
require 'cypher_builder/where'
require 'cypher_builder/and'
require 'cypher_builder/eql'
require 'cypher_builder/like'
require 'cypher_builder/return'
require 'cypher_builder/alias'
require 'cypher_builder/order_by'
require 'cypher_builder/limit'
