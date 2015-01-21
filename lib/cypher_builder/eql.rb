module CypherBuilder
  def Eql(left, right)
    Eql.new(left, right)
  end

  class Eql
    include Resolver

    def initialize(left, right)
      @left, @right = wrap(left, right)
    end

    def as_cypher(opts)
      sprintf('%s = %s', resolve(@left, ** opts), resolve(@right, ** opts))
    end
  end
end