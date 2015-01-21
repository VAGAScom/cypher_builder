module CypherBuilder
  class Runner
    class << self
      # @return [Cypher]
      attr_accessor :cypher
    end

    # @param adapter [Adapter]
    def initialize(adapter = Adapter::DEFAULT)
      @adapter = adapter
    end

    def execute(** params)
      payload = Payload.new(params)
      cypher = self.class.cypher.as_cypher(payload: payload)
      @adapter.execute(cypher, payload.necessary)
    end
  end
end