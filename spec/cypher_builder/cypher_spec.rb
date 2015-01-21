require 'spec_helper'

describe Cypher do
  let(:adapter) { instance_spy(Adapter::Neography) }
  describe '.exec' do
    it 'executes with default adapter' do
      c = Node('c')
      cypher_class = Cypher(Match(c),
                            Return(c.name))
      cypher_class.exec(adapter)
      expect(adapter).to have_received(:execute).with('MATCH (c) RETURN c.name', {})
    end
  end
  describe '#execute' do
    it 'executes an empty query' do
      cypher_class = Cypher()
      cypher_class.new(adapter).execute
      expect(adapter).to have_received(:execute).with('', {})
    end
    it 'executes a simple query' do
      c = Node('c')
      cypher_class = Cypher(Match(c),
                            Return(c.name))
      cypher_class.new(adapter).execute
      expect(adapter).to have_received(:execute).with('MATCH (c) RETURN c.name', {})
    end
    it 'executes the most complex query possible (exercises everything currently implemented)' do
      c = Node('c', labels: 'what')
      cypher_class = Cypher(Match(c),
                            Where(And(Eql(c.stuff, Param('thing')),
                                      Like(c.staff, 'test%'))),
                            Return(c.name, Alias(c.stuff, 'something')))
      cypher_class.new(adapter).execute(thing: 'of course')
      expect(adapter).to have_received(:execute).with('MATCH (c:what) WHERE c.stuff = {thing} AND c.staff LIKE "test%" RETURN c.name, c.stuff AS something', {thing: 'of course'})
    end
    context 'with Opt' do
      before do
        c = Node('c')
        @cypher_class = Cypher(Match(c),
                               Opt(name: Return(c.name),
                                   thing: Return(c.thing)))

        @cypher_class2 = Cypher(Match(c),
                                Where(Opt(name: Eql(c.name, Param('name')),
                                          thing: Eql(c.thing, Param('thing')))),
                                Return(Opt(name: c.name, thing: c.thing)))
      end
      it 'generates first option' do
        @cypher_class.new(adapter).execute(name: true)
        expect(adapter).to have_received(:execute).with('MATCH (c) RETURN c.name', {})
      end
      it 'generates first option with multiple uses' do
        @cypher_class2.new(adapter).execute(name: 'Testing Test')
        expect(adapter).to have_received(:execute).with('MATCH (c) WHERE c.name = {name} RETURN c.name', {name: 'Testing Test'})
      end
      it 'generates second option' do
        @cypher_class.new(adapter).execute(thing: true)
        expect(adapter).to have_received(:execute).with('MATCH (c) RETURN c.thing', {})
      end
      it 'generates second option with multiple uses' do
        @cypher_class2.new(adapter).execute(thing: 123)
        expect(adapter).to have_received(:execute).with('MATCH (c) WHERE c.thing = {thing} RETURN c.thing', {thing: 123})
      end
      it 'defaults to firts option' do
        @cypher_class.new(adapter).execute
        expect(adapter).to have_received(:execute).with('MATCH (c) RETURN c.name', {})
      end
    end
  end
end