module CypherBuilder
  def Param(name)
    Param.new(name)
  end

  class Param
    def initialize(name)
      @name = name
    end

    def as_cypher(payload:)
      payload.will_be_used(@name)
      sprintf('{%s}', @name)
    end
  end
end