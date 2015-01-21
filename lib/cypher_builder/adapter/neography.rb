class CypherBuilder::Adapter::Neography
  def initialize
    @neo = ::Neography::Rest.new
  end

  # @param query [#to_s]
  # @param params [#to_h]
  # @return [[{}]]
  def execute(query, params)
    result = @neo.execute(query.to_s, params.to_h)
    columns = result['columns']
    data = result['data']
    data.map { |values| columns.zip(values).to_h }
  end
end