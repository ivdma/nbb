module Nbb
  class Base
    def self.format
      :json
    end

    def self.base_url
      'http://db.basketball.nl/db'
    end

    def self.url
      [base_url, format, endpoint].join('/')
    end

    def self.json_root
      fail NotImplementedError, 'When inheriting from Nbb::Base, please implement `::json_root`.'
    end

    def self.model
      fail NotImplementedError, 'When inheriting from Nbb::Base, please implement `::model`.'
    end

    def self.endpoint
      fail NotImplementedError, 'When inheriting from Nbb::Base, please implement `::endpoint`.'
    end

    def self.raw_response(query_string = {})
      query_string.reject! { |_, v| v.nil? }
      HTTParty.get([url, query_string.to_param].join('?'))
    end

    def self.response(query_string = {})
      json = raw_response(query_string)
      json[json_root].map { |data| model.new(data) }
    end
  end
end
