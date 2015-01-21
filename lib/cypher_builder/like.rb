module CypherBuilder
  def Like(left, right)
    Like.new(left, right)
  end

  class Like
    include Resolver

    def initialize(left, right)
      @left, @right = wrap(left, right)
    end

    def as_cypher(opts)
      sprintf('%s LIKE %s', resolve(@left, ** opts), resolve(@right, ** opts))
    end
  end
end