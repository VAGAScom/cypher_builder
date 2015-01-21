module CypherBuilder
  def Cypher(*args)
    Class.new(Runner).tap do |the_class|
      the_class.cypher = Cypher.new(*args)
    end
  end

  class Cypher
    include Resolver

    def initialize(*parts)
      @parts = wrap(*parts)
    end

    def as_cypher(opts)
      resolve(@parts, ** opts)
    end
  end
end