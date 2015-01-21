require 'spec_helper'

describe Adapter::Neography do
  let(:neo) { instance_spy(Neography::Rest, execute_query: {'columns' => ['c1', 'c2'], 'data' => [['abc', 1], ['def', 2]]}) }
  let(:adapter) { Adapter::Neography.new(neo) }
  it 'calls Neography' do
    adapter.execute('blah', {some_param: 'test'})
    expect(neo).to have_received(:execute_query).with('blah', {some_param: 'test'})
  end
  it 'transforms result' do
    result = adapter.execute('blah', {some_param: 'test'})
    expect(result).to eq [{c1: 'abc', c2: 1}, {c1: 'def', c2: 2}]
  end
end