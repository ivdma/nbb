require 'httparty'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/to_param'

require 'nbb/models/base'
require 'nbb/models/club'
require 'nbb/models/team'

require 'nbb/version'

module Nbb
  include
  def self.format
    :json
  end

  def self.url
    'http://db.basketball.nl/db'
  end

  def self.clubs(options = {})
    params = {}
    organization_id = options.delete(:organization_id) || options.delete(:org_id)

    params[:org_id] = organization_id if organization_id

    url = [self.url, format, 'club.pl'].join('/')
    url = [url, params.to_param].join('?')

    response = HTTParty.get(url)
    response['clubs'].map { |club| Nbb::Models::Club.new(club) }
  end

  def self.teams(options = {})
    params = {}
    club_id = options.delete(:clb_ID) || options.delete(:club_id)
    raise ArgumentError, 'Missing `clb_ID` (or `club_id`) parameter.' unless club_id

    params[:clb_ID] = club_id

    url = [self.url, format, 'team.pl'].join('/')
    url = [url, params.to_param].join('?')

    response = HTTParty.get(url)
    response['teams'].map { |team| Nbb::Models::Team.new(team) }
  end
end

NBB = Nbb
