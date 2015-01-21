module CypherBuilder
  def Eql(left, right)
    Eql.new(left, right)
  end

  class Eql
    include Resolver

    def initialize(left, right)
      @left, @right = wrap(left, right)
    end

    def as_cypher(payload:, context: )
      sprintf('%s = %s',
              resolve(@left, payload: payload, context: context.add(self)),
              resolve(@right, payload: payload, context: context.add(self)))
    end
  end
end