module Nbb
  class Competitions < Nbb::Base
    def self.endpoint
      'competities.pl'
    end

    def self.all(params = {})
      organization_id = params.delete(:organization_id) || params.delete(:org_ID)
      date            = params.delete(:date)

      query_string = {}.tap do |hash|
        hash[:org_ID] = organization_id if organization_id
        hash[:date]   = date            if date
      end

      competitions query_string
    end

    def self.competitions(query_string = {})
      response(query_string)['competities'].map { |competition| Nbb::Models::Competition.new(competition) }
    end
  end
end
