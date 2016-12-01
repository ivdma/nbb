[![Circle CI](https://circleci.com/gh/ivdma/nbb.svg?style=svg)](https://circleci.com/gh/ivdma/nbb)
[![Gem Version](https://badge.fury.io/rb/nbb.svg)](https://badge.fury.io/rb/nbb)
[![Dependency Status](https://gemnasium.com/ivdma/nbb.svg)](https://gemnasium.com/ivdma/nbb)
[![Code Climate](https://codeclimate.com/github/ivdma/nbb/badges/gpa.svg)](https://codeclimate.com/github/ivdma/nbb)
[![Test Coverage](https://codeclimate.com/github/ivdma/nbb/badges/coverage.svg)](https://codeclimate.com/github/ivdma/nbb/coverage)
[![Issue Count](https://codeclimate.com/github/ivdma/nbb/badges/issue_count.svg)](https://codeclimate.com/github/ivdma/nbb)

# Nbb

This Ruby gem parses [Nederlandse Basketbal Bond (NBB)](http://db.basketball.nl/help/koppelingen/json) JSON API and returns plain old Ruby objects.

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

This gem provides access to read-only API endpoints and needs no authentication.

### Clubs

Get all registered clubs in NBB.

```ruby
Nbb.clubs(options)
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

`Nbb.clubs` accepts `options` hash with the following keys:

  - `organization_id` or `org_ID` (optional) which scopes the results to local organization only.

### Club

Get a single registered club based on it's id.

```ruby
Nbb.club(356)
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

Get all competitions within Nbb

```ruby
Nbb.competitions(options)
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

### Matches

Get matches of the season based on criteria

```ruby
Nbb.matches club_id: 356
```

```ruby
[
  <Nbb::Models::Match:0x007f9d7cec6e10
    @cmp_id="2820",
    @cmp_nr="LHS2DA",
    @datum=nil,
    @id="694242",
    @loc_id="768",
    @nr="CG",
    @org_id="1",
    @score_thuis="0",
    @score_uit="0",
    @stats="0",
    @thuis_club_id="356",
    @thuis_ploeg="Celeritas-Donar HS 1",
    @thuis_ploeg_id="3145",
    @uit_club_id="355",
    @uit_ploeg="Flying Red HS 1",
    @uit_ploeg_id="3703">,
  # ...
]
```

`Nbb.matches` accepts `options` hash with the following keys:

  - `club_id` or `clb_ID` (**required**) is the ID of the club.
  - `cmp_ID` or `competition_id` (optional) matches of which competition to show.
  - `clb_ID` or `club_id` (optional) matches of which club to show
  - `date` or `updated_after` (optional) show matches updated after this date
  - `loc_ID` or `location_id` (optional) matches which played on this location
  - `plg_ID` or `team_id` (optional) match of this team
  - `wed_ID` or `game_id` (optional) get specified match (returns an array of one match)

### Teams

Get club teams registered within Nbb

```ruby
Nbb.teams club_id: 356
```

```ruby
[
  <Nbb::Models::Team:0x007fd3b5924cb8
    @club_id="356",
    @comp_id="2531",
    @id="3587",
    @naam="Dames 1">,
  <Nbb::Models::Team:0x007fd3b59248a8
    @club_id="356",
    @comp_id="2386",
    @id="9298",
    @naam="Dames U20 1">,
  # ...
]
```

`Nbb.teams` accepts `options` hash with the following keys:

  - `club_id` or `clb_ID` (**required**) is the ID of the club.

## Roadmap

- Implement Positions (standen)
- Implement Locations (sporthallen)
- Implement Stats (statistieken)
- Implement different search filters
- Implement custom search methods (for example something like club.teams.find_by_id(1))

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec spec` to run the
tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ivdma/nbb. This project is intended to
be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
