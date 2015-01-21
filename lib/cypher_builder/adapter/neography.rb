class CypherBuilder::Adapter::Neography
  def initialize(neo = ::Neography::Rest.new)
    @neo = neo
  end

  # @param query [#to_s]
  # @param params [#to_h]
  # @return [Array<Hash{Symbol => Object}>]
  def execute(query, params)
    result = @neo.execute_query(query.to_s, params.to_h)
    columns = result['columns'].map { |it| it.to_sym }
    data = result['data']
    data.map { |values| columns.zip(values).to_h }
  end
end