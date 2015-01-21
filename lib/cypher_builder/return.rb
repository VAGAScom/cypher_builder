module CypherBuilder
  def Return(*parts)
    Return.new(*parts)
  end

  class Return
    include Resolver

    def initialize(*parts)
      @parts = wrap(*parts)
    end

    def as_cypher(payload:, context: )
      sprintf('RETURN %s', resolve(@parts, separator: ', ', payload: payload, context: context.add(self)))
    end
  end
end