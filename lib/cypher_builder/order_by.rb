module CypherBuilder
  class MicroResolver < Struct.new(:payload, :context)
    include Resolver
    def execute(value)
      resolve(value, payload: payload, context: context)
    end
  end

  def OrderBy(first, *rest)
    OrderBy.new(first, *rest)
  end

  class OrderBy
    include Resolver
    def initialize(first, *rest)
      @parts = wrap(*([first] + rest))
    end

    def as_cypher(payload:, context:)
      rsv = MicroResolver.new(payload, context.add(self))
      
      ps = @parts.reduce([]) do |r, v|
        if r.last && AsIs === v
          r[0..-2] + [[r.last, rsv.execute(v)].join(' ')]
        else
          r + [rsv.execute(v)]
        end
      end
      sprintf('ORDER BY %s', ps.join(', '))
    end
  end
end