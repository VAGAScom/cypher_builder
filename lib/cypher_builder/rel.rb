module CypherBuilder
  def Rel(prefix, labels: [])
    Rel.new(prefix, labels: labels)
  end

  class Rel < BasicObject
    def initialize(prefix, labels: [], from: nil, to: nil)
      @prefix, @labels = prefix, ::Kernel.Array(labels)
      @from, @to = from, to
    end

    def as_cypher(payload:, context:)
      ::Kernel.sprintf('%s-[%s]->%s',
                       (@from ? @from.as_cypher(payload: payload, context: context.add(self)) : '()'),
                       [@prefix, *@labels].compact.join(':'),
                       (@to ? @to.as_cypher(payload: payload, context: context.add(self)) : '()'))
    end

    def from(node = nil)
      return Field.new(@prefix, 'from') if node == nil
      Rel.new(@prefix, labels: @labels, from: node, to: @to)
    end

    def to(node = nil)
      return Field.new(@prefix, 'to') if node == nil
      Rel.new(@prefix, labels: @labels, from: @from, to: node)
    end

    def respond_to_missing?(name, include_private = false)
      true
    end

    def method_missing(name, *_)
      Field.new(@prefix, name)
    end
  end
end