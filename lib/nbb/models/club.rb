module Nbb
  module Models
    class Club < Nbb::Models::Base
      ATTRIBUTES = [:id, :org_id, :nr, :naam, :shirt, :adres, :postcode, :plaats, :web, :vestpl].freeze
      attr_accessor(*ATTRIBUTES)

      def contact_address
        "#{adres} #{postcode}, #{plaats}"
      end

      def name
        naam
      end

      def organization_id
        org_id
      end

      def address
        adres
      end

      def zipcode
        postcode
      end
    end
  end
end
