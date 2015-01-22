module CypherBuilder
  def Limit(*args)
    Limit.new(*args)
  end

  class Limit
    include Resolver
    def initialize(value)
      @value = value
    end

    def as_cypher(_)
      sprintf('LIMIT %d', @value.to_i)
    end
  end
end