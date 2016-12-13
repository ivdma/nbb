module Nbb
  class Locations < Nbb::Base
    def self.endpoint
      'locatie.pl'
    end

    def self.json_root
      'locaties'
    end

    def self.model
      Nbb::Models::Location
    end

    def self.all(params = {})
      query_string = {}
      query_string[:org_id] = params.delete(:organization_id) || params.delete(:org_id)
      query_string[:date]   = params.delete(:date)

      response query_string
    end
  end
end
