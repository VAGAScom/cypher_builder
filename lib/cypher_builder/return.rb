module CypherBuilder
  def Return(*parts)
    Return.new(*parts)
  end

  class Return
    include Resolver

    def initialize(*parts)
      @parts = wrap(*parts)
    end

    def as_cypher(opts)
      sprintf('RETURN %s', resolve(@parts, separator: ', ', **opts))
    end
  end
end