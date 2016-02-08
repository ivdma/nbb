module Nbb
  class Positions < Nbb::Base
    def self.endpoint
      'stand.pl'
    end

    def self.json_root
      'stand'
    end

    def self.model
      Nbb::Models::Position
    end

    def self.all(params = {})
      competition_id = params.delete(:cmp_ID) || params.delete(:competition_id)
      fail ArgumentError, 'Missing `cmp_ID` (or `competition_id`) parameter.' unless competition_id

      query_string = {}
      query_string[:cmp_ID] = competition_id

      response query_string
    end
  end
end
