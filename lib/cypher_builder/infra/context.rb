class CypherBuilder::Context
  def initialize(context = [])
    @parents = context
  end

  def add(part)
    Context.new([part] + @parents)
  end

  def ancestor?(a_class)
    @parents.find { |p| a_class === p }
  end
end