module CypherBuilder
  def And(*parts)
    And.new(*parts)
  end

  class And
    include Resolver

    def initialize(*parts)
      @parts = wrap(*parts)
    end

    def as_cypher(opts)
      resolve(@parts, separator: ' AND ', ** opts)
    end
  end
end