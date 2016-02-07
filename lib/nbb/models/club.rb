module Nbb
  module Models
    class Club < Nbb::Models::Base
      ATTRIBUTES = [:id, :org_id, :nr, :naam, :shirt, :adres, :postcode, :plaats, :web, :vestpl].freeze
      attr_accessor(*ATTRIBUTES)

      def contact_address
        "#{adres} #{postcode}, #{plaats}"
      end

      alias_method :name, :naam
      alias_method :organization_id, :org_id
      alias_method :address, :adres
      alias_method :zipcode, :postcode
    end
  end
end
