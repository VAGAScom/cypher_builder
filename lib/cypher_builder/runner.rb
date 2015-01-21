module CypherBuilder
  class Runner
    class << self
      # @return [Cypher]
      attr_accessor :cypher

      def exec(adapter = Adapter::DEFAULT, ** params)
        self.new(adapter).execute(** params)
      end
    end

    # @param adapter [Adapter]
    def initialize(adapter = Adapter::DEFAULT)
      @adapter = adapter
    end

    def execute(** params)
      payload = Payload.new(params)
      context = Context.new
      cypher = self.class.cypher.as_cypher(payload: payload, context: context)
      @adapter.execute(cypher, payload.necessary)
    end
  end
end