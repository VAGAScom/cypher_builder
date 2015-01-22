require 'spec_helper'

describe Node do
  let(:node) { Node('x', labels: 'uga') }

  describe '#as_cypher' do
    let(:node_prefix_only) { Node('x') }
    let(:node_multiple_labels) { Node('x', labels: ['uga', 'buga']) }

    it 'converts to be used in "match"' do
      expect(node.as_cypher).to eq '(x:uga)'
      expect(node_prefix_only.as_cypher).to eq '(x)'
      expect(node_multiple_labels.as_cypher).to eq '(x:uga:buga)'
    end
  end

  describe '#respond_to?' do
    it 'is true for #as_cypher' do
      expect(node.respond_to?(:as_cypher)).to be_truthy
    end
    it 'is true for any method' do
      expect(node.respond_to?(:anything)).to be_truthy
    end
  end

  describe 'any method' do
    it 'responds with a Field' do
      expect(node.some_field).to be_instance_of Field
    end
  end
end