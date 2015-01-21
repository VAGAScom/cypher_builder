# CypherBuilder

[![Gem Version](https://badge.fury.io/rb/cypher_builder.svg)](http://badge.fury.io/rb/cypher_builder)

Build Cypher query classes (Neo4j).

It creates Command classes that executes Cypher queries using Neography. The goal is make class creation easier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cypher_builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cypher_builder

## Usage

    include CypherBuilder

    MyQuery = Cypher(Match('c:something'),
                     Where(Eql('c.name', Param('full_name'))),
                     Return('c.name',
                            Alias('c.stuff', 'description')))

Then, later:

    query = MyQuery.new(Adapter::Neography.new)
    array_of_hashes = query.execute(full_name: 'My Stuff')

Or:

    # Default adapter to "Adapter::Neography"
    array_of_hashes = MyQuery.exec(full_name: 'My Stuff')

## Contributing

1. Fork it ( https://github.com/ruliana/cypher_builder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
