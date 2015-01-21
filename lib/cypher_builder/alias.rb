module CypherBuilder
  def Alias(field, an_alias)
    Alias.new(field, an_alias)
  end

  class Alias
    include Resolver

    def initialize(field, an_alias)
      @field = wrap(field)
      @an_alias = an_alias
    end

    def as_cypher(payload:, context: )
      sprintf('%s AS %s', resolve(@field, payload: payload, context: context.add(self)), @an_alias)
    end
  end
end