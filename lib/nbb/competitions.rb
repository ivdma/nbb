module Nbb
  class Competitions < Nbb::Base
    def self.endpoint
      'competities.pl'
    end

    def self.json_root
      'competities'
    end

    def self.model
      Nbb::Models::Competition
    end

    def self.all(params = {})
      query_string = {}
      query_string[:org_ID] = params.delete(:organization_id) || params.delete(:org_ID)
      query_string[:date]   = params.delete(:date)

      response query_string
    end
  end
end
