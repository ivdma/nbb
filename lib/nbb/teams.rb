module Nbb
  class Teams < Nbb::Base
    def self.endpoint
      'team.pl'
    end

    def self.json_root
      'teams'
    end

    def self.model
      Nbb::Models::Team
    end

    def self.all(params = {})
      club_id = params.delete(:clb_ID) || params.delete(:club_id)
      fail ArgumentError, 'Missing `clb_ID` (or `club_id`) parameter.' unless club_id

      query_string = {}
      query_string[:clb_ID] = club_id

      response query_string
    end
  end
end
