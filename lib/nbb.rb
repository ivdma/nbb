require 'httparty'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/to_param'

require 'nbb/models/base'
require 'nbb/models/club'

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
    response['clubs'].map { |club| Models::Club.new(club) }
  end
end

NBB = Nbb
