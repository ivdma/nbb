module Nbb
  class Teams < Nbb::Base
    def self.endpoint
      'team.pl'
    end

    def self.all(params = {})
      club_id = params.delete(:clb_ID) || params.delete(:club_id)
      fail ArgumentError, 'Missing `clb_ID` (or `club_id`) parameter.' unless club_id

      query_string = {}
      query_string[:clb_ID] = club_id

      teams(query_string)
    end

    private_class_method def self.teams(query_string)
      response(query_string)['teams'].map { |team| Nbb::Models::Team.new(team) }
    end
  end
end
