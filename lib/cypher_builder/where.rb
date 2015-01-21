module CypherBuilder
  def Where(*parts)
    Where.new(*parts)
  end

  class Where
    include Resolver

    def initialize(*parts)
      @parts = wrap(*parts)
    end

    def as_cypher(payload:, context: )
      resolve(@parts, format: 'WHERE %s', separator: ' AND ', payload: payload, context: context.add(self))
    end
  end
end