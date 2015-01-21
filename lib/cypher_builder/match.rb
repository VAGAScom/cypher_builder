module CypherBuilder
  def Match(*args)
    Match.new(*args)
  end

  class Match
    include Resolver

    def initialize(*parts)
      @parts = wrap(*parts)
    end

    def as_cypher(opts)
      resolve(@parts, format: 'MATCH (%s)', separator: ', ', ** opts)
    end
  end
end