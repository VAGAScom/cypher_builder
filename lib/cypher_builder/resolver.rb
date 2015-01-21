module CypherBuilder::Resolver
  def wrap(*values)
    values.map do |v|
      if v.respond_to?(:as_cypher)
        v
      else
        Literal.new(v)
      end
    end
  end

  def resolve(parts, format: '%s', separator: ' ', payload:)
    Array(parts).map { |p| sprintf(format, p.as_cypher(payload: payload)) }.join(separator).strip
  end
end