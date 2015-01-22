require 'spec_helper'

describe OrderBy do
  describe '#as_cypher' do
    let(:payload) { instance_spy(Payload) }
    let(:context) { instance_spy(Context) }
    let(:c) { Node('c') }

    it 'formats simple case' do
      ob = OrderBy(c.something)
      expect(ob.as_cypher(payload: payload, context: context)).to eq 'ORDER BY c.something'
    end

    it 'formats multiple elements' do
      ob = OrderBy(c.something, c.other)
      expect(ob.as_cypher(payload: payload, context: context)).to eq 'ORDER BY c.something, c.other'
    end

    it 'formats using :asc/:desc' do
      ob = OrderBy(c.something, :desc, c.other)
      expect(ob.as_cypher(payload: payload, context: context)).to eq 'ORDER BY c.something desc, c.other'
    end
  end
end