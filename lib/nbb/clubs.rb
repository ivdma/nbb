module Nbb
  class Clubs < Nbb::Base
    def self.endpoint
      'club.pl'
    end

    def self.json_root
      'clubs'
    end

    def self.model
      Nbb::Models::Club
    end

    def self.all(params = {})
      query_string = {}
      query_string[:org_id] = params.delete(:organization_id) || params.delete(:org_id)
      query_string[:date]   = params.delete(:date)

      response query_string
    end

    def self.find(id)
      response.find { |club| club.id == id.to_s }
    end
  end
end
