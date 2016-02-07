module Nbb
  class Matches < Nbb::Base
    def self.endpoint
      'wedstrijd.pl'
    end

    def self.json_root
      'wedstrijden'
    end

    def self.model
      Nbb::Models::Match
    end

    def self.all(params = {})
      query_string = {}
      query_string[:cmp_ID] = params.delete(:competition_id) || params.delete(:cmp_ID)
      query_string[:clb_ID] = params.delete(:club_id) || params.delete(:clb_ID)
      query_string[:date]   = params.delete(:updated_after) || params.delete(:date)
      query_string[:loc_ID] = params.delete(:location_id) || params.delete(:loc_ID)
      query_string[:plg_ID] = params.delete(:team_id) || params.delete(:plg_ID)
      query_string[:wed_ID] = params.delete(:game_id) || params.delete(:wed_ID)

      response query_string
    end
  end
end
