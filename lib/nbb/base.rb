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
  end
end
