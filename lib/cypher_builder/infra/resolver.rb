module CypherBuilder::Resolver
  def wrap(*values)
    values.map do |v|
      if v.respond_to?(:as_cypher)
        v
      elsif Symbol === v
        AsIs.new(v)
      else
        Literal.new(v)
      end
    end
  end

  def resolve(parts, format: '%s', separator: ' ', ** opts)
    Array(parts).map do |p|
      sprintf(format, p.as_cypher(** opts))
    end.join(separator).strip
  end
end