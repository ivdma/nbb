[![Gem Version](https://badge.fury.io/rb/nbb.svg)](https://badge.fury.io/rb/nbb)
[![Circle CI](https://circleci.com/gh/ivdma/nbb.svg?style=svg)](https://circleci.com/gh/ivdma/nbb)
[![Dependency Status](https://gemnasium.com/ivdma/nbb.svg)](https://gemnasium.com/ivdma/nbb)
[![Code Climate](https://codeclimate.com/github/ivdma/nbb/badges/gpa.svg)](https://codeclimate.com/github/ivdma/nbb)
[![Test Coverage](https://codeclimate.com/github/ivdma/nbb/badges/coverage.svg)](https://codeclimate.com/github/ivdma/nbb/coverage)
[![Issue Count](https://codeclimate.com/github/ivdma/nbb/badges/issue_count.svg)](https://codeclimate.com/github/ivdma/nbb)

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

Get all registered clubs in NBB.

```ruby
NBB.clubs(options)
```

```ruby
[
  <Nbb::Models::Club:0x007f986bf31af0
    @adres="Bloemstraat 32-b",
    @id="356",
    @naam="Celeritas-Donar",
    @nr="5142",
    @org_id="5",
    @plaats="Groningen",
    @postcode="9712LE",
    @shirt="Geel",
    @vestpl="Groningen",
    @web="http://www.celeritasdonar.nl/">,
  # ...
]
```

`NBB.clubs` accepts `options` hash with the following keys:

  - `organization_id` or `org_ID` (optional) which scopes the results to local organization only.

### Club

Get a single registered club based on it's id.

```ruby
NBB.club(356)
```

```ruby
<Nbb::Models::Club:0x007f986bf31af0
  @adres="Bloemstraat 32-b",
  @id="356",
  @naam="Celeritas-Donar",
  @nr="5142",
  @org_id="5",
  @plaats="Groningen",
  @postcode="9712LE",
  @shirt="Geel",
  @vestpl="Groningen",
  @web="http://www.celeritasdonar.nl/">
```

### Competitions

Get all competitions within NBB

```ruby
NBB.competitions(options)
```

```ruby
[
  <Nbb::Models::Competition:0x007fec98c9a630
    @gewijzigd="2015-12-20 18:34:30",
    @id="2529",
    @naam="Nrd Mannen Senioren 3A",
    @nr="NMS-3A",
    @org_id="5">,
  <Nbb::Models::Competition:0x007fec98c9a450
    @gewijzigd="2015-12-20 18:34:30",
    @id="2530",
    @naam="Nrd Mannen Senioren 3B",
    @nr="NMS-3B",
    @org_id="5">,
  # ...
]
```

### Teams

Get club teams registered within NBB

```ruby
teams = NBB.teams club_id: 356
```

```ruby
[
  <NBB::Models::Team:0x007fd3b5924cb8
    @club_id="356",
    @comp_id="2531",
    @id="3587",
    @naam="Dames 1">,
  <NBB::Models::Team:0x007fd3b59248a8
    @club_id="356",
    @comp_id="2386",
    @id="9298",
    @naam="Dames U20 1">,
  # ...
]
```

`NBB.teams` accepts `options` hash with the following keys:

  - `club_id` or `clb_ID` (**required**) is the ID of the club.

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
