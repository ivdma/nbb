module Nbb
  module Models
    class Location < Nbb::Models::Base
      ATTRIBUTES = %i(adres plaats org_id telefoon id lat lon naam postcode nr).freeze
      attr_accessor(*ATTRIBUTES)

      alias_method :address, :adres
      alias_method :place, :plaats
      alias_method :organization_id, :org_id
      alias_method :phone, :telefoon
      alias_method :lat, :lat
      alias_method :lng, :lon
      alias_method :name, :naam
      alias_method :zip, :postcode
      alias_method :iss_id, :nr
    end
  end
end
