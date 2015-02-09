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
      'MATCH ' + resolve(@parts, separator: ', ', payload: payload, context: context.add(self))
    end
  end
end