module Nbb
  module Models
    class Competition
      ATTRIBUTES = [:id, :org_id, :gewijzigd, :naam, :nr]
      ATTRIBUTES.each { |attribute| attr_accessor attribute }

      def initialize(attributes = {})
        attributes = attributes.with_indifferent_access
        attributes.each do |key, value|
          send("#{key}=", value) if ATTRIBUTES.include? key.to_sym
        end
      end

      def name
        naam
      end

      def organization_id
        org_id
      end

      def updated_at
        gewijzigd
      end

      def iss_id
        nr
      end
    end
  end
end
