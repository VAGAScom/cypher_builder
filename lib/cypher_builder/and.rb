module CypherBuilder
  def And(*parts)
    And.new(*parts)
  end

  class And
    include Resolver

    def initialize(*parts)
      @parts = wrap(*parts)
    end

    def as_cypher(payload:, context: )
      resolve(@parts, separator: ' AND ', payload: payload, context: context.add(self))
    end
  end
end