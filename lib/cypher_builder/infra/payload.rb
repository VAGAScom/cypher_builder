class CypherBuilder::Payload
  class WithStatus < Struct.new(:value, :status)
    def to_status(new_status)
      WithStatus.new(value, new_status)
    end
  end

  def initialize(params)
    @params = params.map { |k, v| [k.to_sym, with_status(v, :pending)] }.to_h
  end

  def will_be_used(param_name)
    set_status(param_name, :will_be_used)
  end

  def already_used(param_name)
    set_status(param_name, :already_used) unless get_status(param_name) == :will_be_used
  end

  def include?(param_name)
    @params.keys.include?(param_name)
  end

  def pendings
    select(:pending)
  end

  def necessary
    select(:will_be_used)
  end

  private

  def get(key)
    @params.fetch(key.to_sym)
  end

  def get_status(key)
    get(key).status
  end

  def set(key, value)
    @params[key.to_sym] = value
  end

  def set_status(key, status)
    set(key, get(key).to_status(status))
  end

  def with_status(value, status)
    WithStatus.new(value, status)
  end

  def select(status)
    @params.
        select { |_, v| v.status == status }.
        map { |k, v| [k, v.value] }.
        to_h
  end
end