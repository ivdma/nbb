require 'httparty'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/to_param'

require 'nbb/models/base'
require 'nbb/models/club'
require 'nbb/models/competition'
require 'nbb/models/location'
require 'nbb/models/match'
require 'nbb/models/team'

require 'nbb/base'
require 'nbb/clubs'
require 'nbb/competitions'
require 'nbb/locations'
require 'nbb/matches'
require 'nbb/teams'
require 'nbb/version'

module Nbb
  def self.clubs(params = {})
    Nbb::Clubs.all(params)
  end

  def self.club(id)
    Nbb::Clubs.find(id)
  end

  def self.competitions(params = {})
    Nbb::Competitions.all(params)
  end

  def self.matches(params = {})
    Nbb::Matches.all(params)
  end

  def self.teams(params = {})
    Nbb::Teams.all(params)
  end
end
