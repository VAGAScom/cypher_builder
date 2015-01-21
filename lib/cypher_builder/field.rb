module CypherBuilder
  def Field(prefix = nil, name)
    Field.new(prefix, name)
  end

  class Field
    attr_reader :name

    def initialize(prefix = nil, name)
      @prefix, @name = prefix, name
    end

    def as_cypher(payload:, context:)
      if context.ancestor?(Return) && !context.ancestor?(Alias)
        aliased
      else
        prefixed_name
      end
    end

    def prefixed_name
      [@prefix, @name].compact.join('.')
    end

    def aliased
      sprintf('%s AS %s', prefixed_name, name)
    end
  end
end