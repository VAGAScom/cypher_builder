module CypherBuilder
  def Field(prefix = nil, name)
    Field.new(prefix, name)
  end

  class Field
    def initialize(prefix = nil, name)
      @prefix, @name = prefix, name
    end

    def as_cypher(_)
      [@prefix, @name].compact.join('.')
    end
  end
end