module CypherBuilder
  def AsIs(*args)
    AsIs.new(*args)
  end

  class AsIs
    include Resolver
    def initialize(value)
      @value = value
    end

    def as_cypher(_)
      @value.to_s
    end
  end
end