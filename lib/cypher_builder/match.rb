module CypherBuilder
  def Match(*args)
    Match.new(*args)
  end

  class Match
    include Resolver

    def initialize(*parts)
      @parts = wrap(*parts)
    end

    def as_cypher(payload:, context: )
      resolve(@parts, format: 'MATCH (%s)', separator: ', ', payload: payload, context: context.add(self))
    end
  end
end