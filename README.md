# NBB

This Ruby gem parses
[Nederlandse Basketbal Bond (NBB) JSON API](http://db.basketball.nl/help/koppelingen/json)
and returns plain old Ruby objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nbb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nbb

## Usage

### Authentication

This gem provides access to read-only methods API endpoints and needs no authentication

### Clubs

```ruby
NBB.clubs(options)
```

```ruby
[
  <Models::Club:0x007fb8a1043678
    @adres="Ouderkerkerdijk 150",
    @id="372",
    @naam="A.P.G.S.",
    @nr="4112",
    @org_id="6",
    @plaats="Amsterdam",
    @postcode="1096CR",
    @shirt="Rood",
    @vestpl="Amsterdam",
    @web="http://www.apgs-amsterdam.nl/">,
  ...
]
```

`options` is a hash that accepts the following methods:

  - `org_ID` (or `organization_id`) which scopes the results to local organization only.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nbb. This project is intended to
be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
