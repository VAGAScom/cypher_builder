module CypherBuilder
  def Opt(*parts)
    Opt.new(*parts)
  end

  class Opt
    include Resolver

    def initialize(** params_and_parts)
      @params_and_parts = Hash[params_and_parts.map { |k, v| [k, wrap(v)] }]
    end

    def as_cypher(payload:)
      param, part = @params_and_parts.find { |k, _| payload.include?(k) }
      part = @params_and_parts.values.first unless part
      payload.already_used(param) if param

      resolve(part, payload: payload)
    end
  end
end