module CypherBuilder
  def Node(prefix, labels: [])
    Node.new(prefix, labels: labels)
  end

  class Node < BasicObject
    def initialize(prefix, labels: [])
      @prefix, @labels = prefix, ::Kernel.Array(labels)
    end

    def as_cypher(_ = nil)
      ::Kernel.sprintf('(%s)', [@prefix, *@labels].compact.join(':'))
    end

    def respond_to_missing?(name, include_private = false)
      true
    end

    def method_missing(name, *_)
      Field.new(@prefix, name)
    end
  end
end