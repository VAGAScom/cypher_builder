require 'spec_helper'

describe Rel do
  let(:rel) { Rel('x', labels: 'uga') }

  describe '#as_cypher' do
    let(:payload) { spy(Payload) }
    let(:context) { spy(Context) }

    it 'converts to be used in "match"' do
      expect(rel.as_cypher(payload: payload, context: context)).to eq '()-[x:uga]->()'

      c = Node('c')
      nr = rel.from(c)
      expect(nr.as_cypher(payload: payload, context: context)).to eq '(c)-[x:uga]->()'

      x = Node('x', labels: 'test')
      nr = rel.from(c).to(x)
      expect(nr.as_cypher(payload: payload, context: context)).to eq '(c)-[x:uga]->(x:test)'
    end
  end

  describe '#respond_to?' do
    it 'is true for #as_cypher' do
      expect(rel.respond_to?(:as_cypher)).to be_truthy
    end
    it 'is true for any method' do
      expect(rel.respond_to?(:anything)).to be_truthy
    end
  end

  describe 'any method' do
    it 'responds with a Field' do
      expect(rel.some_field).to be_instance_of Field
    end
  end
end