require 'httparty'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/to_param'

require 'nbb/models/base'
require 'nbb/models/club'
require 'nbb/models/competition'
require 'nbb/models/team'

require 'nbb/base'
require 'nbb/clubs'
require 'nbb/competitions'
require 'nbb/teams'
require 'nbb/version'

module Nbb
  def self.clubs(params = {})
    @clubs ||= Nbb::Clubs.all(params)
  end

  def self.club(id)
    @club ||= Nbb::Clubs.find(id)
  end

  def self.competitions(params = {})
    @competitions ||= Nbb::Competitions.all(params)
  end

  def self.teams(params = {})
    @teams ||= Nbb::Teams.all(params)
  end
end

NBB = Nbb
