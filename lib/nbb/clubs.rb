module Nbb
  class Clubs < Nbb::Base
    def self.endpoint
      'club.pl'
    end

    def self.all(params = {})
      query_string = {}
      organization_id = params.delete(:organization_id) || params.delete(:org_id)

      query_string[:org_id] = organization_id if organization_id

      response = HTTParty.get([url, query_string.to_param].join('?'))
      response['clubs'].map { |club| Nbb::Models::Club.new(club) }
    end
  end
end
