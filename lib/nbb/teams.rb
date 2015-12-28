module Nbb
  class Teams < Nbb::Base
    def self.endpoint
      'team.pl'
    end

    def self.all(params = {})
      query_string = {}
      club_id = params.delete(:clb_ID) || params.delete(:club_id)
      fail ArgumentError, 'Missing `clb_ID` (or `club_id`) parameter.' unless club_id

      query_string[:clb_ID] = club_id

      response = HTTParty.get([url, query_string.to_param].join('?'))
      response['teams'].map { |team| Nbb::Models::Team.new(team) }
    end
  end
end
