module CypherBuilder
  def Literal(*args)
    Literal.new(*args)
  end

  class Literal
    include Resolver
    def initialize(value)
      @value = value
    end

    def as_cypher(_)
      # TODO escape "'"
      sprintf('"%s"', @value)
    end
  end
end