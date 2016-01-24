module Nbb
  module Models
    class Competition < Nbb::Models::Base
      ATTRIBUTES = [:id, :org_id, :gewijzigd, :naam, :nr]
      attr_accessor(*ATTRIBUTES)

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
