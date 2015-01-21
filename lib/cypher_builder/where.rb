module CypherBuilder
  def Where(*parts)
    Where.new(*parts)
  end

  class Where
    include Resolver

    def initialize(*parts)
      @parts = wrap(*parts)
    end

    def as_cypher(opts)
      resolve(@parts, format: 'WHERE %s', separator: ' AND ', ** opts)
    end
  end
end