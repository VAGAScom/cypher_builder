module CypherBuilder
  def Like(left, right)
    Like.new(left, right)
  end

  class Like
    include Resolver

    def initialize(left, right)
      @left, @right = wrap(left, right)
    end

    def as_cypher(payload:, context: )
      sprintf('%s LIKE %s',
              resolve(@left, payload: payload, context: context.add(self)),
              resolve(@right, payload: payload, context: context.add(self)))
    end
  end
end